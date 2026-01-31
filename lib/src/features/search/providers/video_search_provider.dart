import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart' as yt_exp;
import 'package:yt_sync/src/features/search/models/search_state.dart';
import 'package:yt_sync/src/features/search/models/video_info.dart';
import 'package:yt_sync/src/utils/dio_provider.dart';
import 'package:yt_sync/src/utils/youtube_client.dart';

part 'video_search_provider.g.dart';

@riverpod
Future<SearchState> videoSearch(Ref ref, String query) async {
  if (query.trim().isEmpty) return const EmptyQueryState();

  final yt = ref.watch(youtubeClientProvider);
  final dio = ref.watch(dioProvider);

  try {
    String? videoId;

    // 1. Try to get Video ID using youtube_explode
    final parsedId = yt_exp.VideoId.parseVideoId(query);
    if (parsedId != null) {
      videoId = parsedId;
    } else {
      final searchResult = await yt.search.search(query);
      if (searchResult.isEmpty) {
        return NoVideosFoundState(query);
      }
      videoId = searchResult.first.id.value;
    }

    // 2. Use the local API with the resolved URL to extract info
    final videoUrl = 'https://www.youtube.com/watch?v=$videoId';
    final response = await dio.get('/extract_info', queryParameters: {'url': videoUrl});

    if (response.statusCode == 200 && response.data != null) {
      return SearchSuccess(VideoInfo.fromJson(response.data as Map<String, dynamic>));
    } else {
      return DioState(response.statusMessage ?? 'Failed to extract info');
    }
  } on DioException catch (e) {
    return DioState(e.message ?? e.toString());
  } on yt_exp.YoutubeExplodeException catch (e) {
    return NetworkState(e.toString());
  } catch (e) {
    return UnknownSearchState(e.toString());
  }
}

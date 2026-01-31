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

  try {
    // 1. Check if the query is a single video ID or URL
    final parsedId = yt_exp.VideoId.parseVideoId(query);
    if (parsedId != null) {
      final video = await yt.videos.get(parsedId);
      return SearchSuccess([VideoInfo.fromYoutube(video)]);
    }

    // 2. Otherwise, perform a search for multiple videos
    final searchList = await yt.search.search(query);
    if (searchList.isEmpty) {
      return NoVideosFoundState(query);
    }

    // Map search results to VideoInfo (without audioUrl for now)
    final videos = searchList.map((v) => VideoInfo.fromYoutube(v)).toList();
    return SearchSuccess(videos);
  } on yt_exp.YoutubeExplodeException catch (e) {
    return NetworkState(e.toString());
  } catch (e) {
    return UnknownSearchState(e.toString());
  }
}

/// A provider to fetch full video details (including audioUrl) from the local API.
@riverpod
Future<VideoInfo> fetchVideoDetails(Ref ref, String videoId) async {
  final dio = ref.watch(dioProvider);
  final videoUrl = 'https://www.youtube.com/watch?v=$videoId';

  final response = await dio.get('/extract_info', queryParameters: {'url': videoUrl});

  if (response.statusCode == 200 && response.data != null) {
    return VideoInfo.fromJson(response.data as Map<String, dynamic>);
  } else {
    throw response.statusMessage ?? 'Failed to extract info from local API';
  }
}

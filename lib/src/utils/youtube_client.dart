import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

part 'youtube_client.g.dart';

@Riverpod(keepAlive: true)
YoutubeExplode youtubeClient(Ref ref) {
  final client = YoutubeExplode();
  ref.onDispose(() => client.close());
  return client;
}

import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yt_sync/src/features/search/models/video_info.dart';
import 'package:yt_sync/src/features/search/providers/video_search_provider.dart';

part 'player_provider.g.dart';

@Riverpod(keepAlive: true)
AudioPlayer audioPlayer(Ref ref) {
  final player = AudioPlayer();
  ref.onDispose(() => player.dispose());
  return player;
}

@Riverpod(keepAlive: true)
class PlayerState extends _$PlayerState {
  @override
  VideoInfo? build() => null;

  Future<void> play(VideoInfo video) async {
    VideoInfo fullVideo = video;

    // If audioUrl is missing (e.g. from a search list), fetch it from backend
    if (fullVideo.audioUrl.isEmpty) {
      fullVideo = await ref.read(fetchVideoDetailsProvider(video.videoId).future);
    }

    state = fullVideo;
    final player = ref.read(audioPlayerProvider);
    await player.setUrl(fullVideo.audioUrl);
    player.play();
  }

  void toggle() {
    final player = ref.read(audioPlayerProvider);
    if (player.playing) {
      player.pause();
    } else {
      player.play();
    }
  }
}

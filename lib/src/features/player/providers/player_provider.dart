import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yt_sync/src/features/search/models/video_info.dart';

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

  void play(VideoInfo video) {
    state = video;
    final player = ref.read(audioPlayerProvider);
    player.setUrl(video.audioUrl);
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

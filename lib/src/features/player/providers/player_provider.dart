import 'dart:developer' as dev;

import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yt_sync/src/features/player/models/audio_player_state.dart';
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
  AudioPlayerState build() => const AudioPlayerInitial();

  Future<void> play(VideoInfo video) async {
    clearSeekPlayerOnNewSong();
    state = AudioPlayerLoading(video);

    try {
      VideoInfo fullVideo = video;

      // If audioUrl is missing (e.g. from a search list), fetch it from backend
      dev.log(fullVideo.audioUrl, name: 'PlayerState');
      if (fullVideo.audioUrl.isEmpty) {
        fullVideo = await ref.read(fetchVideoDetailsProvider(video.videoId).future);
      }

      final player = ref.read(audioPlayerProvider);
      await player.setUrl(fullVideo.audioUrl);

      state = AudioPlayerReady(fullVideo);
      player.play();
    } catch (e) {
      state = AudioPlayerError(e.toString(), video: video);
    }
  }

  void clearSeekPlayerOnNewSong() {
    if (state is AudioPlayerReady) {
      dev.log('clearSeekPlayerOnNewSong', name: 'PlayerState');
      final player = ref.read(audioPlayerProvider);
      player.stop();
      player.seek(Duration.zero);
      player.clearAudioSources();
    }
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

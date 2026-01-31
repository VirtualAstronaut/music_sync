import 'package:yt_sync/src/features/search/models/video_info.dart';

sealed class AudioPlayerState {
  const AudioPlayerState();
}

class AudioPlayerInitial extends AudioPlayerState {
  const AudioPlayerInitial();
}

class AudioPlayerLoading extends AudioPlayerState {
  const AudioPlayerLoading(this.video);
  final VideoInfo video;
}

class AudioPlayerReady extends AudioPlayerState {
  const AudioPlayerReady(this.video);
  final VideoInfo video;
}

class AudioPlayerError extends AudioPlayerState {
  const AudioPlayerError(this.message, {this.video});
  final String message;
  final VideoInfo? video;
}

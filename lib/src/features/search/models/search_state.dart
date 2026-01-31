import 'package:yt_sync/src/features/search/models/video_info.dart';

sealed class SearchState {
  const SearchState();
}

class SearchInitial extends SearchState {
  const SearchInitial();
}

class SearchLoading extends SearchState {
  const SearchLoading();
}

class SearchSuccess extends SearchState {
  const SearchSuccess(this.videos);
  final List<VideoInfo> videos;
}

sealed class SearchFailureState extends SearchState {
  const SearchFailureState(this.message);
  final String message;
}

class NoVideosFoundState extends SearchFailureState {
  const NoVideosFoundState(String query) : super('No videos found for "$query"');
}

class NoAudioStreamState extends SearchFailureState {
  const NoAudioStreamState() : super('No audio streams found for this video');
}

class NetworkState extends SearchFailureState {
  const NetworkState(String error) : super('Network error: $error');
}

class DioState extends SearchFailureState {
  const DioState(String error) : super('API Error: $error');
}

class UnknownSearchState extends SearchFailureState {
  const UnknownSearchState(String error) : super('An unknown error occurred: $error');
}

class EmptyQueryState extends SearchFailureState {
  const EmptyQueryState() : super('Please enter a search term');
}

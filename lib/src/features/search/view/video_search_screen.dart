import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yt_sync/src/features/player/providers/player_provider.dart';
import 'package:yt_sync/src/features/search/models/search_state.dart';
import 'package:yt_sync/src/features/search/models/video_info.dart';
import 'package:yt_sync/src/features/search/providers/video_search_provider.dart';
import 'package:yt_sync/src/routing/app_router.dart';
import 'package:yt_sync/src/theme/theme_provider.dart';

class VideoSearchScreen extends ConsumerStatefulWidget {
  const VideoSearchScreen({super.key});

  static const path = '/';
  static const name = 'search';

  @override
  ConsumerState<VideoSearchScreen> createState() => _VideoSearchScreenState();
}

class _VideoSearchScreenState extends ConsumerState<VideoSearchScreen> {
  final _controller = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('YouTube Search'),
        backgroundColor: theme.colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _SearchInput(
              controller: _controller,
              onSearch: (value) => setState(() => _query = value),
            ),
            const SizedBox(height: 24),
            Expanded(child: _SearchResultView(query: _query)),
          ],
        ),
      ),
    );
  }
}

class _SearchInput extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onSearch;

  const _SearchInput({required this.controller, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Search Video',
        hintText: 'Enter keyword or YouTube URL...',
        suffixIcon: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () => onSearch(controller.text),
        ),
        border: const OutlineInputBorder(),
      ),
      onSubmitted: onSearch,
    );
  }
}

class _SearchResultView extends ConsumerWidget {
  final String query;

  const _SearchResultView({required this.query});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (query.isEmpty) {
      return const Center(child: Text('Search for a video to see details'));
    }

    final videoSearchAsync = ref.watch(videoSearchProvider(query));

    return switch (videoSearchAsync) {
      AsyncData(:final value) => switch (value) {
        SearchSuccess(:final videos) => ListView.builder(
          itemCount: videos.length,
          itemBuilder: (context, index) => _VideoListTile(video: videos[index]),
        ),
        SearchFailureState(:final message) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        _ => const SizedBox.shrink(),
      },
      AsyncLoading() => const Center(child: CircularProgressIndicator()),
      AsyncError(:final error) => Center(child: Text('Error: $error')),
    };
  }
}

class _VideoListTile extends ConsumerWidget {
  final VideoInfo video;

  const _VideoListTile({required this.video});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () async {
          // Play automatically fetches missing details via backend API
          dev.log(
            "Playing ${video.title} with id ${video.videoId}",
            name: 'VideoListTile',
          );
          ref.read(playerStateProvider.notifier).play(video);
          PlayerRoute().push(context);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail
            SizedBox(
              width: 140,
              height: 90,
              child: Image.network(
                video.thumbnail,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[300],
                  child: const Icon(Icons.broken_image),
                ),
              ),
            ),
            // Info
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      video.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      video.author,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      video.duration,
                      style: Theme.of(
                        context,
                      ).textTheme.labelSmall?.copyWith(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.play_circle_outline, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
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
        hintText: 'Enter search term...',
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
        SearchSuccess(:final video) => _VideoInfoCard(video: video),
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

class _VideoInfoCard extends ConsumerWidget {
  final VideoInfo video;

  const _VideoInfoCard({required this.video});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            video.thumbnail,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              height: 200,
              color: Colors.grey[300],
              child: const Icon(Icons.broken_image, size: 50),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(video.title, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(
                  'Author: ${video.author}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  'Duration: ${video.duration}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                if (video.audioUrl.isNotEmpty) ...[
                  _AudioPlayerWidget(url: video.audioUrl),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        ref.read(playerStateProvider.notifier).play(video);
                        PlayerRoute().go(context);
                      },
                      icon: const Icon(Icons.play_circle_fill),
                      label: const Text('Open in Player Screen'),
                    ),
                  ),
                ] else
                  const Text('No audio URL found', style: TextStyle(color: Colors.red)),
                const SizedBox(height: 16),
                SelectableText(
                  video.url,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.blue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AudioPlayerWidget extends StatefulWidget {
  final String url;

  const _AudioPlayerWidget({required this.url});

  @override
  State<_AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<_AudioPlayerWidget> {
  late AudioPlayer _player;
  bool _isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _init();
  }

  Future<void> _init() async {
    try {
      await _player.setUrl(widget.url);
      _player.durationStream.listen((d) {
        if (mounted) setState(() => _duration = d ?? Duration.zero);
      });
      _player.positionStream.listen((p) {
        if (mounted) setState(() => _position = p);
      });
      _player.playerStateStream.listen((state) {
        if (mounted) setState(() => _isPlaying = state.playing);
      });
    } catch (e) {
      debugPrint('Error loading audio: $e');
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
              onPressed: () {
                if (_isPlaying) {
                  _player.pause();
                } else {
                  _player.play();
                }
              },
            ),
            Expanded(
              child: Slider(
                value: _position.inMilliseconds.toDouble(),
                max: _duration.inMilliseconds.toDouble(),
                onChanged: (value) {
                  _player.seek(Duration(milliseconds: value.toInt()));
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_formatDuration(_position)),
              Text(_formatDuration(_duration)),
            ],
          ),
        ),
      ],
    );
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:yt_sync/src/features/player/models/audio_player_state.dart';
import 'package:yt_sync/src/features/player/providers/player_provider.dart'
    hide PlayerState;
import 'package:yt_sync/src/features/search/models/video_info.dart';

class PlayerScreen extends ConsumerWidget {
  const PlayerScreen({super.key});

  static const path = '/player';
  static const name = 'player';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerState = ref.watch(playerStateProvider);
    final player = ref.watch(audioPlayerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(switch (playerState) {
          AudioPlayerInitial() => 'Player',
          AudioPlayerLoading(:final video) => video.title,
          AudioPlayerReady(:final video) => video.title,
          AudioPlayerError(:final video) => video?.title ?? 'Error',
        }),
      ),
      body: switch (playerState) {
        AudioPlayerInitial() => const Center(child: Text('No video selected')),
        AudioPlayerLoading(:final video) => _PlayerUI(
          video: video,
          player: player,
          isLoading: true,
        ),
        AudioPlayerReady(:final video) => _PlayerUI(
          video: video,
          player: player,
          isLoading: false,
        ),
        AudioPlayerError(:final message, :final video) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, color: Colors.red, size: 64),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(message, textAlign: TextAlign.center),
              ),
              if (video != null) ...[
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => ref.read(playerStateProvider.notifier).play(video),
                  child: const Text('Retry'),
                ),
              ],
            ],
          ),
        ),
      },
    );
  }
}

class _PlayerUI extends ConsumerWidget {
  final VideoInfo video;
  final AudioPlayer player;
  final bool isLoading;

  const _PlayerUI({required this.video, required this.player, required this.isLoading});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.network(video.thumbnail, fit: BoxFit.contain),
                if (isLoading) const CircularProgressIndicator(color: Colors.white),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(video.title, style: Theme.of(context).textTheme.headlineSmall),
              Text(video.author, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 24),
              StreamBuilder<Duration>(
                stream: player.positionStream,
                builder: (context, snapshot) {
                  final position = snapshot.data ?? Duration.zero;
                  final duration = player.duration ?? Duration.zero;
                  return Column(
                    children: [
                      Slider(
                        value: isLoading
                            ? Duration.zero.inMilliseconds.toDouble()
                            : position.inMilliseconds.toDouble(),
                        min: Duration.zero.inMilliseconds.toDouble(),
                        max: duration.inMilliseconds.toDouble(),
                        onChanged: (value) {
                          player.seek(Duration(milliseconds: value.toInt()));
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_formatDuration(position)),
                          Text(_formatDuration(duration)),
                        ],
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.skip_previous, size: 48),
                    onPressed: () {},
                  ),
                  StreamBuilder<PlayerState>(
                    stream: player.playerStateStream,
                    builder: (context, snapshot) {
                      final playing = snapshot.data?.playing ?? false;
                      return IconButton(
                        icon: Icon(
                          playing ? Icons.pause_circle_filled : Icons.play_circle_filled,
                          size: 64,
                        ),
                        onPressed: isLoading
                            ? null
                            : () => ref.read(playerStateProvider.notifier).toggle(),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.skip_next, size: 48),
                    onPressed: () {},
                  ),
                ],
              ),
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

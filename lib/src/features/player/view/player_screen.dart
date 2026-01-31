import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:yt_sync/src/features/player/providers/player_provider.dart'
    hide PlayerState;

class PlayerScreen extends ConsumerWidget {
  const PlayerScreen({super.key});

  static const path = '/player';
  static const name = 'player';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final video = ref.watch(playerStateProvider);
    final player = ref.watch(audioPlayerProvider);

    if (video == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Player')),
        body: const Center(child: Text('No video selected')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(video.title)),
      body: Column(
        children: [
          Expanded(
            child: Center(child: Image.network(video.thumbnail, fit: BoxFit.contain)),
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
                          value: position.inMilliseconds.toDouble(),
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
                            playing
                                ? Icons.pause_circle_filled
                                : Icons.play_circle_filled,
                            size: 64,
                          ),
                          onPressed: () =>
                              ref.read(playerStateProvider.notifier).toggle(),
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
      ),
    );
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}

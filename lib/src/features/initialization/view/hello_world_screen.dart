import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yt_sync/src/features/initialization/providers/hello_world_provider.dart';
import 'package:yt_sync/src/theme/theme_provider.dart';

class HelloWorldScreen extends ConsumerWidget {
  const HelloWorldScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hello = ref.watch(helloWorldProvider);
    final theme = ref.watch(appThemeProvider);

    return Scaffold(
      body: Center(child: Text(hello, style: theme.textTheme.headlineMedium)),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(appThemeProvider.notifier).toggleTheme(),
        child: const Icon(Icons.brightness_4),
      ),
    );
  }
}

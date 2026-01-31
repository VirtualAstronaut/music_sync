import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yt_sync/src/routing/app_router.dart';
import 'package:yt_sync/src/theme/theme_provider.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(title: 'YT Sync', theme: theme, routerConfig: router);
  }
}

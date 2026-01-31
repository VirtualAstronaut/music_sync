import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yt_sync/src/features/player/view/player_screen.dart';
import 'package:yt_sync/src/features/search/view/video_search_screen.dart';

part 'app_router.g.dart';

@TypedGoRoute<SearchRoute>(path: VideoSearchScreen.path)
class SearchRoute extends GoRouteData with $SearchRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) => const VideoSearchScreen();
}

@TypedGoRoute<PlayerRoute>(path: PlayerScreen.path)
class PlayerRoute extends GoRouteData with $PlayerRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) => const PlayerScreen();
}

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(initialLocation: VideoSearchScreen.path, routes: $appRoutes);
}

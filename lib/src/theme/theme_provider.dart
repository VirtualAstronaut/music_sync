import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class AppTheme extends _$AppTheme {
  @override
  ThemeData build() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.orange,
        brightness: Brightness.light,
      ),
    );
  }

  void toggleTheme() {
    state = state.brightness == Brightness.light ? _darkTheme : _lightTheme;
  }

  static final _lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.orange,
      brightness: Brightness.light,
    ),
  );

  static final _darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.orange,
      brightness: Brightness.dark,
    ),
  );
}

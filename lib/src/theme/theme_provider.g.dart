// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppTheme)
final appThemeProvider = AppThemeProvider._();

final class AppThemeProvider extends $NotifierProvider<AppTheme, ThemeData> {
  AppThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appThemeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appThemeHash();

  @$internal
  @override
  AppTheme create() => AppTheme();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeData value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeData>(value),
    );
  }
}

String _$appThemeHash() => r'3bb9d990d02b028cc5f811bfdc2a93d172fa7fb8';

abstract class _$AppTheme extends $Notifier<ThemeData> {
  ThemeData build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ThemeData, ThemeData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ThemeData, ThemeData>,
              ThemeData,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_search_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(videoSearch)
final videoSearchProvider = VideoSearchFamily._();

final class VideoSearchProvider
    extends
        $FunctionalProvider<
          AsyncValue<SearchState>,
          SearchState,
          FutureOr<SearchState>
        >
    with $FutureModifier<SearchState>, $FutureProvider<SearchState> {
  VideoSearchProvider._({
    required VideoSearchFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'videoSearchProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$videoSearchHash();

  @override
  String toString() {
    return r'videoSearchProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<SearchState> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SearchState> create(Ref ref) {
    final argument = this.argument as String;
    return videoSearch(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is VideoSearchProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$videoSearchHash() => r'6c5eca0b14b67de06d6a913be41aa113ddd897fa';

final class VideoSearchFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<SearchState>, String> {
  VideoSearchFamily._()
    : super(
        retry: null,
        name: r'videoSearchProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  VideoSearchProvider call(String query) =>
      VideoSearchProvider._(argument: query, from: this);

  @override
  String toString() => r'videoSearchProvider';
}

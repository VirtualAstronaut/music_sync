// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(youtubeClient)
final youtubeClientProvider = YoutubeClientProvider._();

final class YoutubeClientProvider
    extends $FunctionalProvider<YoutubeExplode, YoutubeExplode, YoutubeExplode>
    with $Provider<YoutubeExplode> {
  YoutubeClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'youtubeClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$youtubeClientHash();

  @$internal
  @override
  $ProviderElement<YoutubeExplode> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  YoutubeExplode create(Ref ref) {
    return youtubeClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(YoutubeExplode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<YoutubeExplode>(value),
    );
  }
}

String _$youtubeClientHash() => r'30f4ba1a84d312304e580009e2e8997ad8c94bb5';

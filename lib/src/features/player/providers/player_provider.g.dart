// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(audioPlayer)
final audioPlayerProvider = AudioPlayerProvider._();

final class AudioPlayerProvider
    extends $FunctionalProvider<AudioPlayer, AudioPlayer, AudioPlayer>
    with $Provider<AudioPlayer> {
  AudioPlayerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'audioPlayerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$audioPlayerHash();

  @$internal
  @override
  $ProviderElement<AudioPlayer> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AudioPlayer create(Ref ref) {
    return audioPlayer(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AudioPlayer value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AudioPlayer>(value),
    );
  }
}

String _$audioPlayerHash() => r'a0bd7256f42a3a742e3295e76106e9d013150914';

@ProviderFor(PlayerState)
final playerStateProvider = PlayerStateProvider._();

final class PlayerStateProvider
    extends $NotifierProvider<PlayerState, VideoInfo?> {
  PlayerStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playerStateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playerStateHash();

  @$internal
  @override
  PlayerState create() => PlayerState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VideoInfo? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VideoInfo?>(value),
    );
  }
}

String _$playerStateHash() => r'b69154b7713fface108f154af23f80c86fa468a3';

abstract class _$PlayerState extends $Notifier<VideoInfo?> {
  VideoInfo? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<VideoInfo?, VideoInfo?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<VideoInfo?, VideoInfo?>,
              VideoInfo?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

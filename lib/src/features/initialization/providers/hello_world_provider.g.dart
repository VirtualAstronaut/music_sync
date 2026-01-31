// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hello_world_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(helloWorld)
final helloWorldProvider = HelloWorldProvider._();

final class HelloWorldProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  HelloWorldProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'helloWorldProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$helloWorldHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return helloWorld(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$helloWorldHash() => r'bcd5e7b879ec8970fd1bf6ba7fbd605e2909477f';

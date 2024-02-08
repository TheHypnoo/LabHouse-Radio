// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debouncer_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$debouncerNotifierHash() => r'26d2a42f7105585a414503c47e24c6787e775a79';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$DebouncerNotifier extends BuildlessNotifier<Debouncer> {
  late final Duration duration;

  Debouncer build(
    Duration duration,
  );
}

/// See also [DebouncerNotifier].
@ProviderFor(DebouncerNotifier)
const debouncerNotifierProvider = DebouncerNotifierFamily();

/// See also [DebouncerNotifier].
class DebouncerNotifierFamily extends Family<Debouncer> {
  /// See also [DebouncerNotifier].
  const DebouncerNotifierFamily();

  /// See also [DebouncerNotifier].
  DebouncerNotifierProvider call(
    Duration duration,
  ) {
    return DebouncerNotifierProvider(
      duration,
    );
  }

  @override
  DebouncerNotifierProvider getProviderOverride(
    covariant DebouncerNotifierProvider provider,
  ) {
    return call(
      provider.duration,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'debouncerNotifierProvider';
}

/// See also [DebouncerNotifier].
class DebouncerNotifierProvider
    extends NotifierProviderImpl<DebouncerNotifier, Debouncer> {
  /// See also [DebouncerNotifier].
  DebouncerNotifierProvider(
    Duration duration,
  ) : this._internal(
          () => DebouncerNotifier()..duration = duration,
          from: debouncerNotifierProvider,
          name: r'debouncerNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$debouncerNotifierHash,
          dependencies: DebouncerNotifierFamily._dependencies,
          allTransitiveDependencies:
              DebouncerNotifierFamily._allTransitiveDependencies,
          duration: duration,
        );

  DebouncerNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.duration,
  }) : super.internal();

  final Duration duration;

  @override
  Debouncer runNotifierBuild(
    covariant DebouncerNotifier notifier,
  ) {
    return notifier.build(
      duration,
    );
  }

  @override
  Override overrideWith(DebouncerNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: DebouncerNotifierProvider._internal(
        () => create()..duration = duration,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        duration: duration,
      ),
    );
  }

  @override
  NotifierProviderElement<DebouncerNotifier, Debouncer> createElement() {
    return _DebouncerNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DebouncerNotifierProvider && other.duration == duration;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, duration.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DebouncerNotifierRef on NotifierProviderRef<Debouncer> {
  /// The parameter `duration` of this provider.
  Duration get duration;
}

class _DebouncerNotifierProviderElement
    extends NotifierProviderElement<DebouncerNotifier, Debouncer>
    with DebouncerNotifierRef {
  _DebouncerNotifierProviderElement(super.provider);

  @override
  Duration get duration => (origin as DebouncerNotifierProvider).duration;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

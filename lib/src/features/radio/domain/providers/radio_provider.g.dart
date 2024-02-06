// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radio_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$radioRemoteDataSourceHash() =>
    r'5f42562af3fc63734549bdb033c2d8e9b4adbdf6';

/// See also [radioRemoteDataSource].
@ProviderFor(radioRemoteDataSource)
final radioRemoteDataSourceProvider =
    AutoDisposeProvider<RemoteRadioDataSource>.internal(
  radioRemoteDataSource,
  name: r'radioRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$radioRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RadioRemoteDataSourceRef
    = AutoDisposeProviderRef<RemoteRadioDataSource>;
String _$isarRadioDataSourceHash() =>
    r'b92c3ea992df2ca567700f19b69109ec158709cf';

/// See also [isarRadioDataSource].
@ProviderFor(isarRadioDataSource)
final isarRadioDataSourceProvider =
    AutoDisposeProvider<LocalRadioDataSource>.internal(
  isarRadioDataSource,
  name: r'isarRadioDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isarRadioDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsarRadioDataSourceRef = AutoDisposeProviderRef<LocalRadioDataSource>;
String _$radioRepositoryHash() => r'4e59fb735e17546824457769d142b0bba3f86410';

/// See also [radioRepository].
@ProviderFor(radioRepository)
final radioRepositoryProvider = AutoDisposeProvider<RadioRepository>.internal(
  radioRepository,
  name: r'radioRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$radioRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RadioRepositoryRef = AutoDisposeProviderRef<RadioRepository>;
String _$audioHandlerHash() => r'96f6311724b111e85daf9519daa5b063e93c0a26';

/// See also [audioHandler].
@ProviderFor(audioHandler)
final audioHandlerProvider = Provider<MyAudioHandler>.internal(
  audioHandler,
  name: r'audioHandlerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$audioHandlerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AudioHandlerRef = ProviderRef<MyAudioHandler>;
String _$streamMediaItemHash() => r'c040f3692b7ec11865474be9e5b95ded07656e71';

/// See also [streamMediaItem].
@ProviderFor(streamMediaItem)
final streamMediaItemProvider = AutoDisposeStreamProvider<MediaItem?>.internal(
  streamMediaItem,
  name: r'streamMediaItemProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$streamMediaItemHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef StreamMediaItemRef = AutoDisposeStreamProviderRef<MediaItem?>;
String _$streamPlaybackStateHash() =>
    r'bde9efb2a094adbd18718cf6d6fb233c786de052';

/// See also [streamPlaybackState].
@ProviderFor(streamPlaybackState)
final streamPlaybackStateProvider =
    AutoDisposeStreamProvider<PlaybackState>.internal(
  streamPlaybackState,
  name: r'streamPlaybackStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$streamPlaybackStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef StreamPlaybackStateRef = AutoDisposeStreamProviderRef<PlaybackState>;
String _$isarHash() => r'8d186549396a1c483f45306da57eec464b1c2743';

/// See also [isar].
@ProviderFor(isar)
final isarProvider = AutoDisposeProvider<Isar>.internal(
  isar,
  name: r'isarProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isarHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsarRef = AutoDisposeProviderRef<Isar>;
String _$getFavoriteRadiosHash() => r'455074aa3acb43592202b36110a428d5538183cb';

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

/// See also [getFavoriteRadios].
@ProviderFor(getFavoriteRadios)
const getFavoriteRadiosProvider = GetFavoriteRadiosFamily();

/// See also [getFavoriteRadios].
class GetFavoriteRadiosFamily extends Family<AsyncValue<FavoriteRadio?>> {
  /// See also [getFavoriteRadios].
  const GetFavoriteRadiosFamily();

  /// See also [getFavoriteRadios].
  GetFavoriteRadiosProvider call(
    String internalId,
  ) {
    return GetFavoriteRadiosProvider(
      internalId,
    );
  }

  @override
  GetFavoriteRadiosProvider getProviderOverride(
    covariant GetFavoriteRadiosProvider provider,
  ) {
    return call(
      provider.internalId,
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
  String? get name => r'getFavoriteRadiosProvider';
}

/// See also [getFavoriteRadios].
class GetFavoriteRadiosProvider
    extends AutoDisposeFutureProvider<FavoriteRadio?> {
  /// See also [getFavoriteRadios].
  GetFavoriteRadiosProvider(
    String internalId,
  ) : this._internal(
          (ref) => getFavoriteRadios(
            ref as GetFavoriteRadiosRef,
            internalId,
          ),
          from: getFavoriteRadiosProvider,
          name: r'getFavoriteRadiosProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getFavoriteRadiosHash,
          dependencies: GetFavoriteRadiosFamily._dependencies,
          allTransitiveDependencies:
              GetFavoriteRadiosFamily._allTransitiveDependencies,
          internalId: internalId,
        );

  GetFavoriteRadiosProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.internalId,
  }) : super.internal();

  final String internalId;

  @override
  Override overrideWith(
    FutureOr<FavoriteRadio?> Function(GetFavoriteRadiosRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetFavoriteRadiosProvider._internal(
        (ref) => create(ref as GetFavoriteRadiosRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        internalId: internalId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<FavoriteRadio?> createElement() {
    return _GetFavoriteRadiosProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetFavoriteRadiosProvider && other.internalId == internalId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, internalId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetFavoriteRadiosRef on AutoDisposeFutureProviderRef<FavoriteRadio?> {
  /// The parameter `internalId` of this provider.
  String get internalId;
}

class _GetFavoriteRadiosProviderElement
    extends AutoDisposeFutureProviderElement<FavoriteRadio?>
    with GetFavoriteRadiosRef {
  _GetFavoriteRadiosProviderElement(super.provider);

  @override
  String get internalId => (origin as GetFavoriteRadiosProvider).internalId;
}

String _$getFavoritesRadiosListHash() =>
    r'031dc0cd24651137036a5e0c5932cdfd831e3a07';

/// See also [getFavoritesRadiosList].
@ProviderFor(getFavoritesRadiosList)
final getFavoritesRadiosListProvider =
    AutoDisposeFutureProvider<List<FavoriteRadio>>.internal(
  getFavoritesRadiosList,
  name: r'getFavoritesRadiosListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getFavoritesRadiosListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetFavoritesRadiosListRef
    = AutoDisposeFutureProviderRef<List<FavoriteRadio>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

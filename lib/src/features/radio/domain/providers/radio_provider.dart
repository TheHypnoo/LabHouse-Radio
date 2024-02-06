import 'package:audio_service/audio_service.dart';
import 'package:isar/isar.dart';
import 'package:labhouse_radio/src/core/utils/audio_handler.dart';
import 'package:labhouse_radio/src/features/radio/data/datasource/local/isar_radio_data_source.dart';
import 'package:labhouse_radio/src/features/radio/data/datasource/local/local_radio_data_source.dart';
import 'package:labhouse_radio/src/features/radio/data/datasource/remote/http_radio_data_source.dart';
import 'package:labhouse_radio/src/features/radio/data/datasource/remote/remote_radio_data_source.dart';
import 'package:labhouse_radio/src/features/radio/data/models/favorite_model.dart';
import 'package:labhouse_radio/src/features/radio/domain/repositories/radio_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'radio_provider.g.dart';

@riverpod
RemoteRadioDataSource radioRemoteDataSource(RadioRemoteDataSourceRef ref) =>
    HttpRadioDataSource();

@riverpod
LocalRadioDataSource isarRadioDataSource(
  IsarRadioDataSourceRef ref,
) =>
    IsarRadioDataSource(isar: ref.watch(isarProvider));

@riverpod
RadioRepository radioRepository(RadioRepositoryRef ref) => RadioRepository(
      radioDataSource: ref.read(radioRemoteDataSourceProvider),
      localRadioDataSource: ref.read(isarRadioDataSourceProvider),
    );

@Riverpod(keepAlive: true)
MyAudioHandler audioHandler(AudioHandlerRef ref) => MyAudioHandler();

@riverpod
Stream<MediaItem?> streamMediaItem(StreamMediaItemRef ref) =>
    ref.watch(audioHandlerProvider).mediaItem.asBroadcastStream();

@riverpod
Stream<PlaybackState> streamPlaybackState(StreamPlaybackStateRef ref) =>
    ref.watch(audioHandlerProvider).playbackState.asBroadcastStream();

@riverpod
Isar isar(IsarRef ref) {
  throw UnimplementedError();
}

@riverpod
Future<FavoriteRadio?> getFavoriteRadios(
  GetFavoriteRadiosRef ref,
  String internalId,
) async =>
    ref.watch(radioRepositoryProvider).getFavoriteRadios(internalId);

@riverpod
Future<List<FavoriteRadio>> getFavoritesRadiosList(
  GetFavoritesRadiosListRef ref,
) =>
    ref.read(radioRepositoryProvider).getFavoriteRadiosList();

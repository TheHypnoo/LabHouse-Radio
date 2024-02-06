import 'package:isar/isar.dart';
import 'package:labhouse_radio/src/features/radio/data/datasource/local/local_radio_data_source.dart';
import 'package:labhouse_radio/src/features/radio/data/models/favorite_model.dart';

class IsarRadioDataSource extends LocalRadioDataSource {
  IsarRadioDataSource({required Isar isar}) : _isar = isar;

  final Isar _isar;

  @override
  Future<void> addFavoriteRadio(FavoriteRadio radio) async {
    await _isar.writeTxn(() async => _isar.favoriteRadios.put(radio));
  }

  @override
  Future<bool> removeFavoriteRadio(int id) async {
    return _isar.writeTxn(() async => _isar.favoriteRadios.delete(id));
  }

  @override
  Future<FavoriteRadio?> getFavoriteRadios(String internalId) async =>
      _isar.favoriteRadios
          .where()
          .filter()
          .internalIdEqualTo(internalId)
          .findFirst();
  @override
  Future<List<FavoriteRadio>> getFavoriteRadiosList() {
    return _isar.favoriteRadios.where().findAll();
  }
}

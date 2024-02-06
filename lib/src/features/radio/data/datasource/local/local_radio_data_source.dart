import 'package:labhouse_radio/src/features/radio/data/models/favorite_model.dart';

abstract class LocalRadioDataSource {
  Future<List<FavoriteRadio>> getFavoriteRadiosList();
  Future<FavoriteRadio?> getFavoriteRadios(String internalId);
  Future<void> addFavoriteRadio(FavoriteRadio radio);
  Future<bool> removeFavoriteRadio(int id);
}

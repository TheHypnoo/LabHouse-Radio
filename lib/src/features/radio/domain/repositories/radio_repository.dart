import 'package:labhouse_radio/src/features/radio/data/datasource/local/local_radio_data_source.dart';
import 'package:labhouse_radio/src/features/radio/data/datasource/remote/remote_radio_data_source.dart';
import 'package:labhouse_radio/src/features/radio/data/models/favorite_model.dart';
import 'package:labhouse_radio/src/features/radio/data/models/radio_model.dart';

class RadioRepository {
  RadioRepository({
    required this.radioDataSource,
    required this.localRadioDataSource,
  });

  final RemoteRadioDataSource radioDataSource;
  final LocalRadioDataSource localRadioDataSource;

  Future<List<RadioModel>> getRadioList(int pagination) async =>
      radioDataSource.getRadios(pagination);

  Future<void> addFavoriteRadio(FavoriteRadio radio) async =>
      localRadioDataSource.addFavoriteRadio(radio);

  Future<FavoriteRadio?> getFavoriteRadios(String internalId) async =>
      localRadioDataSource.getFavoriteRadios(internalId);

  Future<bool> removeFavoriteRadio(int id) async =>
      localRadioDataSource.removeFavoriteRadio(id);

  Future<List<FavoriteRadio>> getFavoriteRadiosList() async =>
      localRadioDataSource.getFavoriteRadiosList();

  Future<List<RadioModel>> searchRadios(String query) async =>
      radioDataSource.searchRadios(query);
}

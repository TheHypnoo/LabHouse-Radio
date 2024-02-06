import 'package:labhouse_radio/src/features/radio/data/models/radio_model.dart';

abstract class RemoteRadioDataSource {
  Future<List<RadioModel>> getRadios(int pagination);
  Future<List<RadioModel>> searchRadios(String query);
}

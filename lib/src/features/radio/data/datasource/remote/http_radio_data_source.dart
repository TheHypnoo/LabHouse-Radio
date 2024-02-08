import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:labhouse_radio/src/core/constants/constants.dart';
import 'package:labhouse_radio/src/features/radio/data/datasource/remote/remote_radio_data_source.dart';
import 'package:labhouse_radio/src/features/radio/data/models/radio_model.dart';

class HttpRadioDataSource implements RemoteRadioDataSource {
  HttpRadioDataSource();

  @override
  Future<List<RadioModel>> getRadios(int pagination) async {
    final response = await http.get(
      Uri.parse(
        '${apiUrl}search?offset=$pagination&hidebroken=true&has_extended_info=true&order=votes&reverse=true',
      ),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      return data
          .map((e) => RadioModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load radios');
    }
  }

  @override
  Future<List<RadioModel>> searchRadios(String query) async {
    final response = await http.get(
      Uri.parse(
        '${apiUrl}byname/$query?hidebroken=true&has_extended_info=true&order=votes&reverse=true',
      ),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      return data
          .map((e) => RadioModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to search radios');
    }
  }
}

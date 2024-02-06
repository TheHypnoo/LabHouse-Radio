import 'package:freezed_annotation/freezed_annotation.dart';

part 'radio_model.freezed.dart';
part 'radio_model.g.dart';

@freezed
class RadioModel with _$RadioModel {
  const factory RadioModel({
    @JsonKey(name: 'stationuuid') required String? id,
    required String? name,
    @JsonKey(name: 'url_resolved') required String? url,
    required String? favicon,
    required String? country,
    required String? countrycode,
  }) = _RadioModel;
  const RadioModel._();

  factory RadioModel.fromJson(Map<String, dynamic> json) =>
      _$RadioModelFromJson(json);
}

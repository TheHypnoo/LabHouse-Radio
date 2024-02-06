// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radio_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RadioModelImpl _$$RadioModelImplFromJson(Map<String, dynamic> json) =>
    _$RadioModelImpl(
      id: json['stationuuid'] as String?,
      name: json['name'] as String?,
      url: json['url_resolved'] as String?,
      favicon: json['favicon'] as String?,
      country: json['country'] as String?,
      countrycode: json['countrycode'] as String?,
    );

Map<String, dynamic> _$$RadioModelImplToJson(_$RadioModelImpl instance) =>
    <String, dynamic>{
      'stationuuid': instance.id,
      'name': instance.name,
      'url_resolved': instance.url,
      'favicon': instance.favicon,
      'country': instance.country,
      'countrycode': instance.countrycode,
    };

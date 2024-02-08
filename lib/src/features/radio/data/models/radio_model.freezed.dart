// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'radio_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RadioModel _$RadioModelFromJson(Map<String, dynamic> json) {
  return _RadioModel.fromJson(json);
}

/// @nodoc
mixin _$RadioModel {
  @JsonKey(name: 'stationuuid')
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'url_resolved')
  String? get url => throw _privateConstructorUsedError;
  String? get favicon => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get countrycode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RadioModelCopyWith<RadioModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RadioModelCopyWith<$Res> {
  factory $RadioModelCopyWith(
          RadioModel value, $Res Function(RadioModel) then) =
      _$RadioModelCopyWithImpl<$Res, RadioModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'stationuuid') String? id,
      String? name,
      @JsonKey(name: 'url_resolved') String? url,
      String? favicon,
      String? country,
      String? countrycode});
}

/// @nodoc
class _$RadioModelCopyWithImpl<$Res, $Val extends RadioModel>
    implements $RadioModelCopyWith<$Res> {
  _$RadioModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? url = freezed,
    Object? favicon = freezed,
    Object? country = freezed,
    Object? countrycode = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      favicon: freezed == favicon
          ? _value.favicon
          : favicon // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      countrycode: freezed == countrycode
          ? _value.countrycode
          : countrycode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RadioModelImplCopyWith<$Res>
    implements $RadioModelCopyWith<$Res> {
  factory _$$RadioModelImplCopyWith(
          _$RadioModelImpl value, $Res Function(_$RadioModelImpl) then) =
      __$$RadioModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'stationuuid') String? id,
      String? name,
      @JsonKey(name: 'url_resolved') String? url,
      String? favicon,
      String? country,
      String? countrycode});
}

/// @nodoc
class __$$RadioModelImplCopyWithImpl<$Res>
    extends _$RadioModelCopyWithImpl<$Res, _$RadioModelImpl>
    implements _$$RadioModelImplCopyWith<$Res> {
  __$$RadioModelImplCopyWithImpl(
      _$RadioModelImpl _value, $Res Function(_$RadioModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? url = freezed,
    Object? favicon = freezed,
    Object? country = freezed,
    Object? countrycode = freezed,
  }) {
    return _then(_$RadioModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      favicon: freezed == favicon
          ? _value.favicon
          : favicon // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      countrycode: freezed == countrycode
          ? _value.countrycode
          : countrycode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RadioModelImpl extends _RadioModel {
  const _$RadioModelImpl(
      {@JsonKey(name: 'stationuuid') required this.id,
      required this.name,
      @JsonKey(name: 'url_resolved') required this.url,
      required this.favicon,
      required this.country,
      required this.countrycode})
      : super._();

  factory _$RadioModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RadioModelImplFromJson(json);

  @override
  @JsonKey(name: 'stationuuid')
  final String? id;
  @override
  final String? name;
  @override
  @JsonKey(name: 'url_resolved')
  final String? url;
  @override
  final String? favicon;
  @override
  final String? country;
  @override
  final String? countrycode;

  @override
  String toString() {
    return 'RadioModel(id: $id, name: $name, url: $url, favicon: $favicon, country: $country, countrycode: $countrycode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RadioModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.favicon, favicon) || other.favicon == favicon) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.countrycode, countrycode) ||
                other.countrycode == countrycode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, url, favicon, country, countrycode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RadioModelImplCopyWith<_$RadioModelImpl> get copyWith =>
      __$$RadioModelImplCopyWithImpl<_$RadioModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RadioModelImplToJson(
      this,
    );
  }
}

abstract class _RadioModel extends RadioModel {
  const factory _RadioModel(
      {@JsonKey(name: 'stationuuid') required final String? id,
      required final String? name,
      @JsonKey(name: 'url_resolved') required final String? url,
      required final String? favicon,
      required final String? country,
      required final String? countrycode}) = _$RadioModelImpl;
  const _RadioModel._() : super._();

  factory _RadioModel.fromJson(Map<String, dynamic> json) =
      _$RadioModelImpl.fromJson;

  @override
  @JsonKey(name: 'stationuuid')
  String? get id;
  @override
  String? get name;
  @override
  @JsonKey(name: 'url_resolved')
  String? get url;
  @override
  String? get favicon;
  @override
  String? get country;
  @override
  String? get countrycode;
  @override
  @JsonKey(ignore: true)
  _$$RadioModelImplCopyWith<_$RadioModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

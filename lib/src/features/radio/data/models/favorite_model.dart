import 'package:isar/isar.dart';

part 'favorite_model.g.dart';

@collection
class FavoriteRadio {
  Id? id = Isar.autoIncrement;
  String? internalId;
  String? name;
  String? favicon;
  String? url;
  String? country;
}

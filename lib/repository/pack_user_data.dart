
import 'package:isar/isar.dart';

part 'pack_user_data.g.dart';

@collection
class PackUserData {

  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String id;

  int? highScore;

  PackUserData({required this.id, this.highScore});
}

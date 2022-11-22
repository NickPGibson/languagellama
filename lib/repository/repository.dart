

import 'package:isar/isar.dart';
import 'package:languagellama/repository/pack_user_data.dart';

class Repository {

  final Future<Isar> _db;

  static Future<Isar> _openDB() {
    if (Isar.instanceNames.isEmpty) {
      return Isar.open([PackUserDataSchema]);
    }
    return Future.value(Isar.getInstance());
  }

  Future<void> savePacks(List<PackUserData> packs) async {
    final db = await _db;
    await db.writeTxn(() async {
      await db.packUserDatas.putAll(packs);
    });
  }

  Repository() : _db = _openDB(); // might want to pass in _db as a constructor arg for mocking purposes

  Future<List<PackUserData>> getPacks() async {
    final db = await _db;
    return db.packUserDatas.where().findAll();
  }

  Future<PackUserData?> getPackUserData(String id) async {
    final db = await _db;
    return db.packUserDatas.getById(id);
  }

  void setHighScore({required String id, required int highScore}) async {
    final db = await _db;
    final p = PackUserData(id: id, highScore: highScore);
    await db.writeTxn(() async {
      await db.packUserDatas.put(p);
    });
  }
}

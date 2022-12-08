

import 'package:firebase_auth/firebase_auth.dart';
import 'package:isar/isar.dart';
import 'package:languagellama/repository/auth_user.dart';
import 'package:languagellama/repository/exceptions.dart';
import 'package:languagellama/repository/pack_user_data.dart';

class Repository {

  final Future<Isar> _db;

  static Future<Isar> _openDB() {
    if (Isar.instanceNames.isEmpty) {
      return Isar.open([PackUserDataSchema]);
    }
    return Future.value(Isar.getInstance());
  }

  Repository() : _db = _openDB(); // might want to pass in _db as a constructor arg for mocking purposes

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

  Future<void> createAccount({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw ServerException(e.message);
    }
  }

  Future<void> deleteAccount() async {
    try {
      await FirebaseAuth.instance.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw ServerException(e.message);
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw ServerException(e.message);
    }
  }

  Future<void> logout() => FirebaseAuth.instance.signOut();

  AuthUser? getUser() =>
      _fromFirebaseUser(FirebaseAuth.instance.currentUser);

  Stream<AuthUser?> getAuthStateStream() => FirebaseAuth.instance.authStateChanges()
      .map((user) => _fromFirebaseUser(user));

  AuthUser? _fromFirebaseUser(User? user) {
    if (user == null) {
      return null;
    } else {
      return AuthUser(username: user.email);
    }
  }
}

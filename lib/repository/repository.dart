

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:languagellama/repository/auth_user.dart';
import 'package:languagellama/repository/exceptions.dart';
import 'package:languagellama/repository/models/pack_meta_data.dart';
import 'package:languagellama/repository/models/pack_user_data.dart';

class Repository {

  Future<PackUserData?> getPackUserData({required String packId}) async {
    final user = _getFirebaseUser();
    if (user == null) {
      throw ServerException('User not logged in');
    }
    try {
      final ref = FirebaseDatabase.instance.ref("pack_user_data/${user.uid}/$packId");
      final snapshot = await ref.get();
      final v = snapshot.value;
      return v == null ? null : PackUserData.fromJson(Map<String, dynamic>.from(v as Map<dynamic, dynamic>));
    } catch (e) {
      return null;
    }
  }

  Future<Map<String, PackUserData>> getAllPackUserData() async {
    final user = _getFirebaseUser();
    if (user == null) {
      throw ServerException('User not logged in');
    }
    try {
      final ref = FirebaseDatabase.instance.ref("pack_user_data/${user.uid}");
      final snapshot = await ref.get();
      final v = snapshot.value;
      if (v == null) {
        return {};
      }
      final map = v as Map<dynamic, dynamic>;
      return map.map((id, v) => MapEntry(id, PackUserData.fromJson(Map<String, dynamic>.from(v as Map<dynamic, dynamic>))));
    } catch (e) {
      return {};
    }
  }

  Future<Map<String, PackMetaData>> getPackIndex(LanguagePair languages) async {
    final user = _getFirebaseUser();
    if (user == null) {
      throw ServerException('User not logged in');
    }
    try {
      final ref = FirebaseDatabase.instance.ref("pack_index");
      final snapshot = await ref.orderByChild("languages").equalTo(languages.asString).get();
      final v = snapshot.value;
      if (v == null) {
        return {};
      }
      final map = Map<String, dynamic>.from(v as Map<dynamic, dynamic>);
      return map.map(
        (id, v) => MapEntry(id, PackMetaData.fromJson(Map<String, dynamic>.from(v as Map<dynamic, dynamic>))),
      );
    } catch (e) {
      return {};
    }
  }

  Future<Map<String, String>> getPackContents(String packId) async {
    final user = _getFirebaseUser();
    if (user == null) {
      throw ServerException('User not logged in');
    }
    try {
      final ref = FirebaseDatabase.instance.ref("pack_contents/$packId");
      final snapshot = await ref.get();
      final v = snapshot.value;
      if (v == null) {
        return {};
      }
      return Map<String, String>.from(v as Map<dynamic, dynamic>);
    } catch (e) {
      return {};
    }
  }

  void setHighScore({required String packId, required int highScore}) async {
    final user = _getFirebaseUser();
    if (user == null) {
      throw ServerException('User not logged in');
    }
    final ref = FirebaseDatabase.instance.ref("pack_user_data/${user.uid}/$packId");
    ref.update({
      'high_score': highScore
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

  User? _getFirebaseUser() => FirebaseAuth.instance.currentUser;

  AuthUser? getUser() => _fromFirebaseUser(_getFirebaseUser());

  Stream<AuthUser?> getAuthStateStream() => FirebaseAuth.instance.authStateChanges().map((user) => _fromFirebaseUser(user));

  AuthUser? _fromFirebaseUser(User? user) {
    if (user == null) {
      return null;
    } else {
      return AuthUser(username: user.email);
    }
  }
}

enum LanguagePair {
  enEs("en_es");

  const LanguagePair(this.asString);

  final String asString;
}

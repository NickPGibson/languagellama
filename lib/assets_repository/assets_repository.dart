
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:languagellama/assets_repository/models/packs_index.dart';

/// Retrieves static asset data
class AssetsRepository {

  final AssetBundle _assetBundle;

  AssetsRepository(this._assetBundle);

  Future<PacksIndex> get packsIndex async {
    final packIndex = jsonDecode(await _assetBundle.loadString("assets/pack_index.json"));
    return PacksIndex.fromJson(packIndex);
  }

  Future<Map<String, dynamic>> getPackContent(String id) async =>
     jsonDecode(await _assetBundle.loadString("assets/packs/$id.json")) as Map<String, dynamic>;
}



import 'package:json_annotation/json_annotation.dart';

part 'pack_meta_data.g.dart';

@JsonSerializable()
class PackMetaData {

  final String name;
  final String languages;

  PackMetaData({required this.name, required this.languages});

  factory PackMetaData.fromJson(Map<String, dynamic> json) => _$PackMetaDataFromJson(json);

  Map<String, dynamic> toJson() => _$PackMetaDataToJson(this);
}
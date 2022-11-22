
import 'package:json_annotation/json_annotation.dart';
import 'package:languagellama/assets_repository/models/language_pairs.dart';

part 'packs_index.g.dart';

@JsonSerializable()
class PacksIndex {

  @JsonKey(name: "language_pairs")
  final LanguagePairs languagePairs;

  PacksIndex({required this.languagePairs});

  factory PacksIndex.fromJson(Map<String, dynamic> json) => _$PacksIndexFromJson(json);

  Map<String, dynamic> toJson() => _$PacksIndexToJson(this);
}

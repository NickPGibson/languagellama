
import 'package:json_annotation/json_annotation.dart';
import 'package:languagellama/assets_repository/models/static_pack.dart';

part 'language_pair.g.dart';

@JsonSerializable()
class LanguagePair {

  final List<StaticPack> packs;

  LanguagePair({required this.packs});

  factory LanguagePair.fromJson(Map<String, dynamic> json) => _$LanguagePairFromJson(json);

  Map<String, dynamic> toJson() => _$LanguagePairToJson(this);
}

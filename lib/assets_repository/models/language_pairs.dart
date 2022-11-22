
import 'package:json_annotation/json_annotation.dart';
import 'package:languagellama/assets_repository/models/language_pair.dart';

part 'language_pairs.g.dart';

@JsonSerializable()
class LanguagePairs {

  @JsonKey(name: "en_es")
  final LanguagePair enEs;

  LanguagePairs({required this.enEs});

  factory LanguagePairs.fromJson(Map<String, dynamic> json) => _$LanguagePairsFromJson(json);

  Map<String, dynamic> toJson() => _$LanguagePairsToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'pack_user_data.g.dart';

@JsonSerializable()
class PackUserData {

  @JsonKey(name: "high_score")
  final int? highScore;

  PackUserData({required this.highScore});

  factory PackUserData.fromJson(Map<String, dynamic> json) => _$PackUserDataFromJson(json);

  Map<String, dynamic> toJson() => _$PackUserDataToJson(this);
}
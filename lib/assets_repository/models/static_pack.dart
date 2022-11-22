
import 'package:json_annotation/json_annotation.dart';

part 'static_pack.g.dart';

@JsonSerializable()
class StaticPack {

  final String name;
  final String id;

  StaticPack({required this.name, required this.id});

  factory StaticPack.fromJson(Map<String, dynamic> json) => _$StaticPackFromJson(json);

  Map<String, dynamic> toJson() => _$StaticPackToJson(this);
}

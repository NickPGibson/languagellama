// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_pair.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguagePair _$LanguagePairFromJson(Map<String, dynamic> json) => LanguagePair(
      packs: (json['packs'] as List<dynamic>)
          .map((e) => StaticPack.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LanguagePairToJson(LanguagePair instance) =>
    <String, dynamic>{
      'packs': instance.packs,
    };

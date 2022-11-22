// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packs_index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PacksIndex _$PacksIndexFromJson(Map<String, dynamic> json) => PacksIndex(
      languagePairs: LanguagePairs.fromJson(
          json['language_pairs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PacksIndexToJson(PacksIndex instance) =>
    <String, dynamic>{
      'language_pairs': instance.languagePairs,
    };

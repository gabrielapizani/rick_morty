// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharactersInfoModel _$CharactersInfoModelFromJson(Map<String, dynamic> json) =>
    CharactersInfoModel(
      count: json['count'] as int,
      pages: json['pages'] as int,
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );

Map<String, dynamic> _$CharactersInfoModelToJson(
        CharactersInfoModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'pages': instance.pages,
      'next': instance.next,
      'prev': instance.prev,
    };

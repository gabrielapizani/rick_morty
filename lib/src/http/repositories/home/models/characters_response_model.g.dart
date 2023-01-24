// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharactersResponseModel _$CharactersResponseModelFromJson(
        Map<String, dynamic> json) =>
    CharactersResponseModel(
      info: json['info'] == null
          ? null
          : CharactersInfoModel.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => CharactersItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharactersResponseModelToJson(
        CharactersResponseModel instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };

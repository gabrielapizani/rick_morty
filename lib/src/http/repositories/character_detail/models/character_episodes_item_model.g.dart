// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_episodes_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterEpisodesItemModel _$CharacterEpisodesItemModelFromJson(
        Map<String, dynamic> json) =>
    CharacterEpisodesItemModel(
      id: json['id'] as int,
      name: json['name'] as String,
      air_date: json['air_date'] as String,
      episode: json['episode'] as String,
      characters: (json['characters'] as List<dynamic>)
          .map((e) =>
              CharacterDetailItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      url: json['url'] as String,
      created: json['created'] as String,
    );

Map<String, dynamic> _$CharacterEpisodesItemModelToJson(
        CharacterEpisodesItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'air_date': instance.air_date,
      'episode': instance.episode,
      'characters': instance.characters,
      'url': instance.url,
      'created': instance.created,
    };

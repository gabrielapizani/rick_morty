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
      airDate: json['air_date'] as String,
      episode: json['episode'] as String,
      url: json['url'] as String,
      created: json['created'] as String,
    );

Map<String, dynamic> _$CharacterEpisodesItemModelToJson(
        CharacterEpisodesItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'air_date': instance.airDate,
      'episode': instance.episode,
      'url': instance.url,
      'created': instance.created,
    };

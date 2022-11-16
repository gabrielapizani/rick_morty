// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_characters_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteCharactersItemModel _$FavoriteCharactersItemModelFromJson(
        Map<String, dynamic> json) =>
    FavoriteCharactersItemModel(
      id: json['id'] as int,
      name: json['name'] as String,
      status: json['status'] as String,
      species: json['species'] as String,
      type: json['type'] as String,
      gender: json['gender'] as String,
      origin:
          LocationItemModel.fromJson(json['origin'] as Map<String, dynamic>),
      location:
          LocationItemModel.fromJson(json['location'] as Map<String, dynamic>),
      image: json['image'] as String,
      episode: (json['episode'] as List<dynamic>?)
          ?.map((e) => EpisodeItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      url: json['url'] as String,
      created: json['created'] as String,
      isFavorited: json['isFavorited'] as bool,
      totalEpisodes: json['totalEpisodes'] as int,
    );

Map<String, dynamic> _$FavoriteCharactersItemModelToJson(
        FavoriteCharactersItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'type': instance.type,
      'gender': instance.gender,
      'origin': instance.origin,
      'location': instance.location,
      'image': instance.image,
      'episode': instance.episode,
      'url': instance.url,
      'created': instance.created,
      'isFavorited': instance.isFavorited,
      'totalEpisodes': instance.totalEpisodes,
    };

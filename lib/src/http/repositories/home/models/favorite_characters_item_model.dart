import 'package:json_annotation/json_annotation.dart';

import 'episode_item_model.dart';
import 'location_item_model.dart';

part 'favorite_characters_item_model.g.dart';

@JsonSerializable()
class FavoriteCharactersItemModel {
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  LocationItemModel origin;
  LocationItemModel location;
  String image;
  List<EpisodeItemModel>? episode;
  String url;
  String created;
  bool isFavorited;
  int totalEpisodes;

  FavoriteCharactersItemModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    this.episode,
    required this.url,
    required this.created,
    required this.isFavorited,
    required this.totalEpisodes,
  });

  factory FavoriteCharactersItemModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteCharactersItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteCharactersItemModelToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

import 'episode_item_model.dart';
import 'location_item_model.dart';

part 'characters_item_model.g.dart';

@JsonSerializable()
class CharactersItemModel {
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  LocationItemModel origin;
  LocationItemModel location;
  String image;
  List<String> episode;
  String url;
  String created;
  bool? isFavorited;
  int? totalEpisodes;

  CharactersItemModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
    this.isFavorited,
    this.totalEpisodes,
  });

  factory CharactersItemModel.fromJson(Map<String, dynamic> json) =>
      _$CharactersItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersItemModelToJson(this);
}

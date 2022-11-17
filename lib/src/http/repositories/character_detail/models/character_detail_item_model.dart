import 'package:json_annotation/json_annotation.dart';

import 'character_location_item_model.dart';

part 'character_detail_item_model.g.dart';

@JsonSerializable()
class CharacterDetailItemModel {
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  CharacterLocationItemModel origin;
  CharacterLocationItemModel location;
  String image;
  List<String> episode;
  String url;
  String created;
  bool? isFavorited;
  int? totalEpisodes;

  CharacterDetailItemModel({
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

  factory CharacterDetailItemModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterDetailItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterDetailItemModelToJson(this);
}

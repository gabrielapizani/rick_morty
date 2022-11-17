import 'package:json_annotation/json_annotation.dart';
import 'package:rick_morty/src/http/repositories/character_detail/models/character_detail_item_model.dart';

part 'character_episodes_item_model.g.dart';

@JsonSerializable()
class CharacterEpisodesItemModel {
  int id;
  String name;
  String air_date;
  String episode;
  List<CharacterDetailItemModel> characters;
  String url;
  String created;

  CharacterEpisodesItemModel({
    required this.id,
    required this.name,
    required this.air_date,
    required this.episode,
    required this.characters,
    required this.url,
    required this.created,
  });

  factory CharacterEpisodesItemModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterEpisodesItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterEpisodesItemModelToJson(this);
}

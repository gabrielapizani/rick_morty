import 'package:json_annotation/json_annotation.dart';

part 'character_location_item_model.g.dart';

@JsonSerializable()
class CharacterLocationItemModel {
  String name;
  String url;

  CharacterLocationItemModel({
    required this.name,
    required this.url,
  });

  factory CharacterLocationItemModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterLocationItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterLocationItemModelToJson(this);
}

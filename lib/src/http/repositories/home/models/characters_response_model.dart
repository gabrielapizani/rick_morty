import 'package:json_annotation/json_annotation.dart';
import 'package:rick_morty/src/http/repositories/home/models/characters_info_model.dart';

import 'characters_item_model.dart';

part 'characters_response_model.g.dart';

@JsonSerializable()
class CharactersResponseModel {
  final CharactersInfoModel? info;
  final List<CharactersItemModel>? results;

  CharactersResponseModel({
    this.info,
    this.results,
  });

  factory CharactersResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CharactersResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersResponseModelToJson(this);
}

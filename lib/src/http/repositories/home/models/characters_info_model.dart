import 'package:json_annotation/json_annotation.dart';

part 'characters_info_model.g.dart';

@JsonSerializable()
class CharactersInfoModel {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  CharactersInfoModel({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  factory CharactersInfoModel.fromJson(Map<String, dynamic> json) =>
      _$CharactersInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersInfoModelToJson(this);
}

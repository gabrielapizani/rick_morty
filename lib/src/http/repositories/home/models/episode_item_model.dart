import 'package:json_annotation/json_annotation.dart';

part 'episode_item_model.g.dart';

@JsonSerializable()
class EpisodeItemModel {
  String name;
  String url;

  EpisodeItemModel({
    required this.name,
    required this.url,
  });

  factory EpisodeItemModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeItemModelToJson(this);
}

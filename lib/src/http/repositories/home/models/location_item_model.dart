import 'package:json_annotation/json_annotation.dart';

part 'location_item_model.g.dart';

@JsonSerializable()
class LocationItemModel {
  String name;
  String url;

  LocationItemModel({
    required this.name,
    required this.url,
  });

  factory LocationItemModel.fromJson(Map<String, dynamic> json) =>
      _$LocationItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationItemModelToJson(this);
}

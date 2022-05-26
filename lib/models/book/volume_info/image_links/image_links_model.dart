import 'package:json_annotation/json_annotation.dart';

part 'image_links_model.g.dart';

@JsonSerializable()
class ImageLinksModel {
  @JsonKey(name: 'smallThumbnail')
  String smallThumbnail;

  @JsonKey(name: 'thumbnail')
  String thumbnail;

  ImageLinksModel({
    required this.smallThumbnail,
    required this.thumbnail,
  });

  factory ImageLinksModel.fromJson(Map<String, dynamic> json) =>
      _$ImageLinksModelFromJson(json);
  Map<String, dynamic> toJson() => _$ImageLinksModelToJson(this);
}

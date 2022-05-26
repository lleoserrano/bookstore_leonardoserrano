import 'package:json_annotation/json_annotation.dart';

part 'reading_mode_model.g.dart';

@JsonSerializable()
class ReadingModeModel {
  @JsonKey(name: 'text')
  bool text;

  @JsonKey(name: 'image')
  bool image;

  ReadingModeModel({
    required this.text,
    required this.image,
  });

  factory ReadingModeModel.fromJson(Map<String, dynamic> json) =>
      _$ReadingModeModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReadingModeModelToJson(this);
}

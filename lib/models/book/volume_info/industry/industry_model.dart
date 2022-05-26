import 'package:json_annotation/json_annotation.dart';

part 'industry_model.g.dart';

@JsonSerializable()
class IndustryModel {
  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'identifier')
  String identifier;

  IndustryModel({
    required this.type,
    required this.identifier,
  });

  factory IndustryModel.fromJson(Map<String, dynamic> json) =>
      _$IndustryModelFromJson(json);
  Map<String, dynamic> toJson() => _$IndustryModelToJson(this);
}

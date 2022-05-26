import 'package:json_annotation/json_annotation.dart';

part 'search_info_model.g.dart';

@JsonSerializable()
class SearchInfoModel {
  @JsonKey(name: 'textSnippet')
  String textSnippet;

  SearchInfoModel({
    required this.textSnippet,
  });

  factory SearchInfoModel.fromJson(Map<String, dynamic> json) =>
      _$SearchInfoModelFromJson(json);
  Map<String, dynamic> toJson() => _$SearchInfoModelToJson(this);
}

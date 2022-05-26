import 'package:json_annotation/json_annotation.dart';

import '../book/book_model.dart';

part 'api_response_model.g.dart';

@JsonSerializable()
class ApiResponseModel {
  @JsonKey(name: 'kind')
  String kind;

  @JsonKey(name: 'totalItems')
  int totalItems;

  @JsonKey(name: 'items')
  List<BookModel> items;

  ApiResponseModel({
    required this.kind,
    required this.totalItems,
    required this.items,
  });

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ApiResponseModelToJson(this);
}

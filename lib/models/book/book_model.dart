import 'package:json_annotation/json_annotation.dart';

import 'access_info/access_info_model.dart';
import 'sale_info/sale_info_model.dart';
import 'search_info/search_info_model.dart';
import 'volume_info/volume_info_model.dart';

part 'book_model.g.dart';

@JsonSerializable()
class BookModel {
  @JsonKey(name: 'kind')
  String kind;

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'etag')
  String etag;

  @JsonKey(name: 'selfLink')
  String selfLink;

  @JsonKey(name: 'volumeInfo')
  VolumeInfoModel volumeInfo;

  @JsonKey(name: 'saleInfo')
  SaleInfoModel saleInfo;

  @JsonKey(name: 'accessInfo')
  AccessInfoModel accessInfo;

  @JsonKey(name: 'searchInfo')
  SearchInfoModel? searchInfo;

  BookModel({
    required this.kind,
    required this.id,
    required this.etag,
    required this.selfLink,
    required this.volumeInfo,
    required this.saleInfo,
    required this.accessInfo,
    required this.searchInfo,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);
  Map<String, dynamic> toJson() => _$BookModelToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

import '../price/price_model.dart';

part 'offers_model.g.dart';

@JsonSerializable()
class OffersModel {
  @JsonKey(name: 'finskyOfferType')
  int finskyOfferType;

  @JsonKey(name: 'listPrice')
  PriceModel? listPrice;

  @JsonKey(name: 'retailPrice')
  PriceModel? retailPrice;

  OffersModel({
    required this.finskyOfferType,
    required this.listPrice,
    required this.retailPrice,
  });

  factory OffersModel.fromJson(Map<String, dynamic> json) =>
      _$OffersModelFromJson(json);
  Map<String, dynamic> toJson() => _$OffersModelToJson(this);
}

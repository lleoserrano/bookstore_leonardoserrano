import 'package:json_annotation/json_annotation.dart';

part 'offers_price_model.g.dart';

@JsonSerializable()
class OffersPriceModel {
  @JsonKey(name: 'amountInMicros')
  String amountInMicros;

  @JsonKey(name: 'currencyCode')
  String currencyCode;

  OffersPriceModel({
    required this.amountInMicros,
    required this.currencyCode,
  });

  factory OffersPriceModel.fromJson(Map<String, dynamic> json) =>
      _$OffersPriceModelFromJson(json);
  Map<String, dynamic> toJson() => _$OffersPriceModelToJson(this);
}

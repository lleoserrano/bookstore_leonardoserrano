import 'package:json_annotation/json_annotation.dart';

part 'price_model.g.dart';

@JsonSerializable()
class PriceModel {
  @JsonKey(name: 'amount')
  double? amount;

  @JsonKey(name: 'currencyCode')
  String currencyCode;

  PriceModel({
    required this.amount,
    required this.currencyCode,
  });

  factory PriceModel.fromJson(Map<String, dynamic> json) =>
      _$PriceModelFromJson(json);
  Map<String, dynamic> toJson() => _$PriceModelToJson(this);
}

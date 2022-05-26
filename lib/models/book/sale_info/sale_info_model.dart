import 'package:json_annotation/json_annotation.dart';

import 'offers/offers_model.dart';
import 'price/price_model.dart';

part 'sale_info_model.g.dart';

enum SaleAbility { NOT_FOR_SALE, FOR_SALE, FREE }

extension SaleInfoModelExtension on SaleInfoModel {
  bool checkIsAvailableToBuy() =>
      saleability == SaleAbility.NOT_FOR_SALE ? false : true;

  String getValueForSale() => saleability == SaleAbility.FREE
      ? SaleAbility.FREE.name
      : '${listPrice?.amount} ${listPrice?.currencyCode}';
}

@JsonSerializable()
class SaleInfoModel {
  @JsonKey(name: 'country')
  String country;

  @JsonKey(name: 'saleability')
  SaleAbility saleability;

  @JsonKey(name: 'isEbook')
  bool isEbook;

  @JsonKey(name: 'listPrice')
  PriceModel? listPrice;

  @JsonKey(name: 'retailPrice')
  PriceModel? retailPrice;

  @JsonKey(name: 'buyLink')
  String? buyLink;

  @JsonKey(name: 'offers', defaultValue: [])
  List<OffersModel> offers;

  SaleInfoModel({
    required this.country,
    required this.saleability,
    required this.isEbook,
    required this.listPrice,
    required this.retailPrice,
    required this.buyLink,
    required this.offers,
  });

  factory SaleInfoModel.fromJson(Map<String, dynamic> json) =>
      _$SaleInfoModelFromJson(json);
  Map<String, dynamic> toJson() => _$SaleInfoModelToJson(this);
}

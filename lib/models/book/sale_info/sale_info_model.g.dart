// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaleInfoModel _$SaleInfoModelFromJson(Map<String, dynamic> json) =>
    SaleInfoModel(
      country: json['country'] as String,
      saleability: $enumDecode(_$SaleAbilityEnumMap, json['saleability']),
      isEbook: json['isEbook'] as bool,
      listPrice: json['listPrice'] == null
          ? null
          : PriceModel.fromJson(json['listPrice'] as Map<String, dynamic>),
      retailPrice: json['retailPrice'] == null
          ? null
          : PriceModel.fromJson(json['retailPrice'] as Map<String, dynamic>),
      buyLink: json['buyLink'] as String?,
      offers: (json['offers'] as List<dynamic>?)
              ?.map((e) => OffersModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$SaleInfoModelToJson(SaleInfoModel instance) =>
    <String, dynamic>{
      'country': instance.country,
      'saleability': _$SaleAbilityEnumMap[instance.saleability],
      'isEbook': instance.isEbook,
      'listPrice': instance.listPrice,
      'retailPrice': instance.retailPrice,
      'buyLink': instance.buyLink,
      'offers': instance.offers,
    };

const _$SaleAbilityEnumMap = {
  SaleAbility.NOT_FOR_SALE: 'NOT_FOR_SALE',
  SaleAbility.FOR_SALE: 'FOR_SALE',
  SaleAbility.FREE: 'FREE',
};

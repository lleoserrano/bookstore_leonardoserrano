// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OffersModel _$OffersModelFromJson(Map<String, dynamic> json) => OffersModel(
      finskyOfferType: json['finskyOfferType'] as int,
      listPrice: json['listPrice'] == null
          ? null
          : PriceModel.fromJson(json['listPrice'] as Map<String, dynamic>),
      retailPrice: json['retailPrice'] == null
          ? null
          : PriceModel.fromJson(json['retailPrice'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OffersModelToJson(OffersModel instance) =>
    <String, dynamic>{
      'finskyOfferType': instance.finskyOfferType,
      'listPrice': instance.listPrice,
      'retailPrice': instance.retailPrice,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offers_price_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OffersPriceModel _$OffersPriceModelFromJson(Map<String, dynamic> json) =>
    OffersPriceModel(
      amountInMicros: json['amountInMicros'] as String,
      currencyCode: json['currencyCode'] as String,
    );

Map<String, dynamic> _$OffersPriceModelToJson(OffersPriceModel instance) =>
    <String, dynamic>{
      'amountInMicros': instance.amountInMicros,
      'currencyCode': instance.currencyCode,
    };

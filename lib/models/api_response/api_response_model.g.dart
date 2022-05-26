// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseModel _$ApiResponseModelFromJson(Map<String, dynamic> json) =>
    ApiResponseModel(
      kind: json['kind'] as String,
      totalItems: json['totalItems'] as int,
      items: (json['items'] as List<dynamic>)
          .map((e) => BookModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ApiResponseModelToJson(ApiResponseModel instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'totalItems': instance.totalItems,
      'items': instance.items,
    };

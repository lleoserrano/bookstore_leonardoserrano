// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookModel _$BookModelFromJson(Map<String, dynamic> json) => BookModel(
      kind: json['kind'] as String,
      id: json['id'] as String,
      etag: json['etag'] as String,
      selfLink: json['selfLink'] as String,
      volumeInfo:
          VolumeInfoModel.fromJson(json['volumeInfo'] as Map<String, dynamic>),
      saleInfo:
          SaleInfoModel.fromJson(json['saleInfo'] as Map<String, dynamic>),
      accessInfo:
          AccessInfoModel.fromJson(json['accessInfo'] as Map<String, dynamic>),
      searchInfo: json['searchInfo'] == null
          ? null
          : SearchInfoModel.fromJson(
              json['searchInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
      'kind': instance.kind,
      'id': instance.id,
      'etag': instance.etag,
      'selfLink': instance.selfLink,
      'volumeInfo': instance.volumeInfo,
      'saleInfo': instance.saleInfo,
      'accessInfo': instance.accessInfo,
      'searchInfo': instance.searchInfo,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessInfoModel _$AccessInfoModelFromJson(Map<String, dynamic> json) =>
    AccessInfoModel(
      country: json['country'] as String,
      viewability: json['viewability'] as String,
      embeddable: json['embeddable'] as bool,
      publicDomain: json['publicDomain'] as bool,
      textToSpeechPermission: json['textToSpeechPermission'] as String,
      epubIsAvailable: AccessInfoModel.getBoolInformation(json, 'epub') as bool,
      pdfIsAvailable: AccessInfoModel.getBoolInformation(json, 'pdf') as bool,
      webReaderLink: json['webReaderLink'] as String,
      accessViewStatus: json['accessViewStatus'] as String,
      quoteSharingAllowed: json['quoteSharingAllowed'] as bool,
    );

Map<String, dynamic> _$AccessInfoModelToJson(AccessInfoModel instance) =>
    <String, dynamic>{
      'country': instance.country,
      'viewability': instance.viewability,
      'embeddable': instance.embeddable,
      'publicDomain': instance.publicDomain,
      'textToSpeechPermission': instance.textToSpeechPermission,
      'epub': instance.epubIsAvailable,
      'pdf': instance.pdfIsAvailable,
      'webReaderLink': instance.webReaderLink,
      'accessViewStatus': instance.accessViewStatus,
      'quoteSharingAllowed': instance.quoteSharingAllowed,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volume_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VolumeInfoModel _$VolumeInfoModelFromJson(Map<String, dynamic> json) =>
    VolumeInfoModel(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String? ?? '',
      authors: (json['authors'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      publisher: json['publisher'] as String?,
      publishedDate: json['publishedDate'] as String?,
      description: json['description'] as String?,
      industryIdentifiers: (json['industryIdentifiers'] as List<dynamic>?)
              ?.map((e) => IndustryModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      readingModes: ReadingModeModel.fromJson(
          json['readingModes'] as Map<String, dynamic>),
      pageCount: json['pageCount'] as int?,
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      averageRating: (json['averageRating'] as num?)?.toDouble() ?? 0,
      ratingsCount: json['ratingsCount'] as int? ?? 0,
      maturityRating: json['maturityRating'] as String,
      allowAnonLogging: json['allowAnonLogging'] as bool,
      contentVersion: json['contentVersion'] as String,
      panelizationSummary: json['panelizationSummary'] == null
          ? null
          : PanelizationSummaryModel.fromJson(
              json['panelizationSummary'] as Map<String, dynamic>),
      imageLinks: json['imageLinks'] == null
          ? null
          : ImageLinksModel.fromJson(
              json['imageLinks'] as Map<String, dynamic>),
      language: json['language'] as String,
      previewLink: json['previewLink'] as String,
      infoLink: json['infoLink'] as String,
      canonicalVolumeLink: json['canonicalVolumeLink'] as String,
    );

Map<String, dynamic> _$VolumeInfoModelToJson(VolumeInfoModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'authors': instance.authors,
      'publisher': instance.publisher,
      'publishedDate': instance.publishedDate,
      'description': instance.description,
      'industryIdentifiers': instance.industryIdentifiers,
      'readingModes': instance.readingModes,
      'pageCount': instance.pageCount,
      'categories': instance.categories,
      'averageRating': instance.averageRating,
      'ratingsCount': instance.ratingsCount,
      'maturityRating': instance.maturityRating,
      'allowAnonLogging': instance.allowAnonLogging,
      'contentVersion': instance.contentVersion,
      'panelizationSummary': instance.panelizationSummary,
      'imageLinks': instance.imageLinks,
      'language': instance.language,
      'previewLink': instance.previewLink,
      'infoLink': instance.infoLink,
      'canonicalVolumeLink': instance.canonicalVolumeLink,
    };

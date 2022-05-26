import 'package:json_annotation/json_annotation.dart';

import 'image_links/image_links_model.dart';
import 'industry/industry_model.dart';
import 'panelization_summary/panelization_summary_model.dart';
import 'reading_mode/reading_mode_model.dart';

part 'volume_info_model.g.dart';

@JsonSerializable()
class VolumeInfoModel {
  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'subtitle', defaultValue: '')
  String? subtitle;

  @JsonKey(name: 'authors', defaultValue: [])
  List<String> authors;

  @JsonKey(name: 'publisher')
  String? publisher;

  @JsonKey(name: 'publishedDate')
  String? publishedDate;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'industryIdentifiers', defaultValue: [])
  List<IndustryModel> industryIdentifiers;

  @JsonKey(name: 'readingModes')
  ReadingModeModel readingModes;

  @JsonKey(name: 'pageCount')
  int? pageCount;

  @JsonKey(name: 'categories', defaultValue: [])
  List<String> categories;

  @JsonKey(name: 'averageRating', defaultValue: 0)
  double averageRating;

  @JsonKey(name: 'ratingsCount', defaultValue: 0)
  int ratingsCount;

  @JsonKey(name: 'maturityRating')
  String maturityRating;

  @JsonKey(name: 'allowAnonLogging')
  bool allowAnonLogging;

  @JsonKey(name: 'contentVersion')
  String contentVersion;

  @JsonKey(name: 'panelizationSummary')
  PanelizationSummaryModel? panelizationSummary;

  @JsonKey(name: 'imageLinks')
  ImageLinksModel? imageLinks;

  @JsonKey(name: 'language')
  String language;

  @JsonKey(name: 'previewLink')
  String previewLink;

  @JsonKey(name: 'infoLink')
  String infoLink;

  @JsonKey(name: 'canonicalVolumeLink')
  String canonicalVolumeLink;

  VolumeInfoModel({
    required this.title,
    required this.subtitle,
    required this.authors,
    required this.publisher,
    required this.publishedDate,
    required this.description,
    required this.industryIdentifiers,
    required this.readingModes,
    required this.pageCount,
    required this.categories,
    required this.averageRating,
    required this.ratingsCount,
    required this.maturityRating,
    required this.allowAnonLogging,
    required this.contentVersion,
    required this.panelizationSummary,
    required this.imageLinks,
    required this.language,
    required this.previewLink,
    required this.infoLink,
    required this.canonicalVolumeLink,
  });

  factory VolumeInfoModel.fromJson(Map<String, dynamic> json) =>
      _$VolumeInfoModelFromJson(json);
  Map<String, dynamic> toJson() => _$VolumeInfoModelToJson(this);
}

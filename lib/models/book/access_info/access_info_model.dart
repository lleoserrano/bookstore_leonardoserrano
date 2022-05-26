import 'package:json_annotation/json_annotation.dart';

part 'access_info_model.g.dart';

@JsonSerializable()
class AccessInfoModel {
  @JsonKey(name: 'country')
  String country;

  @JsonKey(name: 'viewability')
  String viewability;

  @JsonKey(name: 'embeddable')
  bool embeddable;

  @JsonKey(name: 'publicDomain')
  bool publicDomain;

  @JsonKey(name: 'textToSpeechPermission')
  String textToSpeechPermission;

  @JsonKey(name: 'epub', readValue: getBoolInformation)
  bool epubIsAvailable;

  @JsonKey(name: 'pdf', readValue: getBoolInformation)
  bool pdfIsAvailable;

  @JsonKey(name: 'webReaderLink')
  String webReaderLink;

  @JsonKey(name: 'accessViewStatus')
  String accessViewStatus;

  @JsonKey(name: 'quoteSharingAllowed')
  bool quoteSharingAllowed;

  AccessInfoModel({
    required this.country,
    required this.viewability,
    required this.embeddable,
    required this.publicDomain,
    required this.textToSpeechPermission,
    required this.epubIsAvailable,
    required this.pdfIsAvailable,
    required this.webReaderLink,
    required this.accessViewStatus,
    required this.quoteSharingAllowed,
  });

  static bool getBoolInformation(
    Map<dynamic, dynamic> map,
    String value,
  ) {
    return map[value]['isAvailable'] ?? false;
  }

  factory AccessInfoModel.fromJson(Map<String, dynamic> json) =>
      _$AccessInfoModelFromJson(json);
  Map<String, dynamic> toJson() => _$AccessInfoModelToJson(this);
}

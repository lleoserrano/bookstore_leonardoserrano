import 'package:json_annotation/json_annotation.dart';

part 'panelization_summary_model.g.dart';

@JsonSerializable()
class PanelizationSummaryModel {
  @JsonKey(name: 'containsEpubBubbles')
  bool containsEpubBubbles;

  @JsonKey(name: 'containsImageBubbles')
  bool containsImageBubbles;

  PanelizationSummaryModel({
    required this.containsEpubBubbles,
    required this.containsImageBubbles,
  });

  factory PanelizationSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$PanelizationSummaryModelFromJson(json);
  Map<String, dynamic> toJson() => _$PanelizationSummaryModelToJson(this);
}

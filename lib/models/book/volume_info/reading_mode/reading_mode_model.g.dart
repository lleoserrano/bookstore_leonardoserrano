// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reading_mode_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReadingModeModel _$ReadingModeModelFromJson(Map<String, dynamic> json) =>
    ReadingModeModel(
      text: json['text'] as bool,
      image: json['image'] as bool,
    );

Map<String, dynamic> _$ReadingModeModelToJson(ReadingModeModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'image': instance.image,
    };

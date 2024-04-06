import 'package:json_annotation/json_annotation.dart';

part 'multi_media_model.g.dart';

@JsonSerializable()
class MultiMediaModel {
  final String url;
  final String format;
  final int height;
  final int width;
  final String type;
  final String subtype;
  final String caption;

  const MultiMediaModel({
    required this.url,
    required this.format,
    required this.height,
    required this.width,
    required this.type,
    required this.subtype,
    required this.caption,
  });

  factory MultiMediaModel.fromJson(Map<String, dynamic> json) => _$MultiMediaModelFromJson(json);
  Map<String, dynamic> toJson() => _$MultiMediaModelToJson(this);
}

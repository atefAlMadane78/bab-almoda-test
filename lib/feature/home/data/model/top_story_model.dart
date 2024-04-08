// option_model.dart

import 'package:babalomoda/feature/home/data/model/multi_media_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'top_story_model.g.dart';

@JsonSerializable()
class TopStoryModel extends Equatable {
  final String section;
  final String subsection;
  final String title;
  final String abstract;
  final String url;
  final String byline;
  @JsonKey(name: 'item_type')
  final String itemType;
  @JsonKey(name: 'updated_date')
  final String updatedDate;
  @JsonKey(name: 'created_date')
  final String createdDate;
  @JsonKey(name: 'published_date')
  final String publishedDate;
  @JsonKey(name: 'material_type_facet')
  final String materialTypeFacet;
  final String kicker;
  @JsonKey(name: 'des_facet')
  final List<String> desFacet;
  @JsonKey(name: 'org_facet')
  final List<String> orgFacet;
  @JsonKey(name: 'per_facet')
  final List<String> perFacet;
  @JsonKey(name: 'geo_facet')
  final List<String> geoFacet;
  final List<MultiMediaModel>? multimedia;

  const TopStoryModel({
    required this.section,
    required this.subsection,
    required this.title,
    required this.abstract,
    required this.url,
    required this.byline,
    required this.itemType,
    required this.updatedDate,
    required this.createdDate,
    required this.publishedDate,
    required this.materialTypeFacet,
    required this.kicker,
    required this.desFacet,
    required this.orgFacet,
    required this.perFacet,
    required this.geoFacet,
    required this.multimedia,
  });

  factory TopStoryModel.fromJson(Map<String, dynamic> json) =>
      _$TopStoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$TopStoryModelToJson(this);

  @override
  List<Object?> get props => [
        section,
        subsection,
        title,
        abstract,
        url,
        byline,
        itemType,
        updatedDate,
        createdDate,
        publishedDate,
        materialTypeFacet,
        kicker,
        desFacet,
        orgFacet,
        perFacet,
        geoFacet,
        multimedia,
      ];
}

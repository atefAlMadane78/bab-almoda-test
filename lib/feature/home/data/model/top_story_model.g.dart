// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_story_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopStoryModel _$TopStoryModelFromJson(Map<String, dynamic> json) =>
    TopStoryModel(
      section: json['section'] as String,
      subsection: json['subsection'] as String,
      title: json['title'] as String,
      abstract: json['abstract'] as String,
      url: json['url'] as String,
      byline: json['byline'] as String,
      itemType: json['item_type'] as String,
      updatedDate: json['updated_date'] as String,
      createdDate: json['created_date'] as String,
      publishedDate: json['published_date'] as String,
      materialTypeFacet: json['material_type_facet'] as String,
      kicker: json['kicker'] as String,
      desFacet:
          (json['des_facet'] as List<dynamic>).map((e) => e as String).toList(),
      orgFacet:
          (json['org_facet'] as List<dynamic>).map((e) => e as String).toList(),
      perFacet:
          (json['per_facet'] as List<dynamic>).map((e) => e as String).toList(),
      geoFacet:
          (json['geo_facet'] as List<dynamic>).map((e) => e as String).toList(),
      multimedia: (json['multimedia'] as List<dynamic>)
          .map((e) => MultiMediaModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TopStoryModelToJson(TopStoryModel instance) =>
    <String, dynamic>{
      'section': instance.section,
      'subsection': instance.subsection,
      'title': instance.title,
      'abstract': instance.abstract,
      'url': instance.url,
      'byline': instance.byline,
      'item_type': instance.itemType,
      'updated_date': instance.updatedDate,
      'created_date': instance.createdDate,
      'published_date': instance.publishedDate,
      'material_type_facet': instance.materialTypeFacet,
      'kicker': instance.kicker,
      'des_facet': instance.desFacet,
      'org_facet': instance.orgFacet,
      'per_facet': instance.perFacet,
      'geo_facet': instance.geoFacet,
      'multimedia': instance.multimedia,
    };

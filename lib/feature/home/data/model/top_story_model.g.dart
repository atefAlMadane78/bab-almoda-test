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
      itemType: json['itemType'] as String,
      updatedDate: json['updatedDate'] as String,
      createdDate: json['createdDate'] as String,
      publishedDate: json['publishedDate'] as String,
      materialTypeFacet: json['materialTypeFacet'] as String,
      kicker: json['kicker'] as String,
      desFacet:
          (json['desFacet'] as List<dynamic>).map((e) => e as String).toList(),
      orgFacet:
          (json['orgFacet'] as List<dynamic>).map((e) => e as String).toList(),
      perFacet:
          (json['perFacet'] as List<dynamic>).map((e) => e as String).toList(),
      geoFacet:
          (json['geoFacet'] as List<dynamic>).map((e) => e as String).toList(),
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
      'itemType': instance.itemType,
      'updatedDate': instance.updatedDate,
      'createdDate': instance.createdDate,
      'publishedDate': instance.publishedDate,
      'materialTypeFacet': instance.materialTypeFacet,
      'kicker': instance.kicker,
      'desFacet': instance.desFacet,
      'orgFacet': instance.orgFacet,
      'perFacet': instance.perFacet,
      'geoFacet': instance.geoFacet,
      'multimedia': instance.multimedia,
    };

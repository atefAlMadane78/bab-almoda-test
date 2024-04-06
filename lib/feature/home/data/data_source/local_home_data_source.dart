// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:babalomoda/core/config/shared_pref.dart';
import 'package:babalomoda/core/error/exceptions.dart';
import 'package:babalomoda/feature/home/data/model/top_story_model.dart';
import 'package:dartz/dartz.dart';

class HomeLocalDataSource {
  Future<Unit> cacheStories(
      List<TopStoryModel> stories, String? section) async {
    final jsonStories = json.encode(stories.map((e) => e.toJson()).toList());
    Preferences.prefs!.setString('CACHED_STORIES-$section', jsonStories);
    return Future.value(unit);
  }

  Future<Unit> cacheStroyDetails(TopStoryModel stroy, int index) async {
    final jsonStroyDetails = json.encode(stroy.toJson());
    Preferences.prefs!
        .setString('CACHED_STORY_DETAILS-$index', jsonStroyDetails);
    return Future.value(unit);
  }

  Future<List<TopStoryModel>> getCachedStories(
      {required String? section}) async {
    List<TopStoryModel> storiesList = [];
    final jsonString = Preferences.prefs!.getString('CACHED_STORIES-$section');
    if (jsonString != null) {
      final List jsonData = json.decode(jsonString);
      final storiesFromJson = jsonData
          .map<TopStoryModel>((jsonPlan) => TopStoryModel.fromJson(jsonPlan))
          .toList();

      for (TopStoryModel element in storiesFromJson) {
        storiesList.add(element);
      }

      if (storiesList.isNotEmpty) {
        return storiesList;
      } else {
        throw EmptyCacheException();
      }
    } else {
      throw EmptyCacheException();
    }
  }

  Future<TopStoryModel> getCachedPlanDetails({
    required int index,
  }) async {
    TopStoryModel details;
    final jsonString =
        Preferences.prefs!.getString('CACHED_STORY_DETAILS-$index');
    if (jsonString != null) {
      final decodedData = json.decode(jsonString);
      details = TopStoryModel.fromJson(decodedData);

      return details;
    } else {
      throw EmptyCacheException();
    }
  }
}

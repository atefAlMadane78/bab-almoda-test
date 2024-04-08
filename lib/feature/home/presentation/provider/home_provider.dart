import 'package:babalomoda/core/config/cache_response.dart';
import 'package:babalomoda/core/config/enum.dart';
import 'package:babalomoda/core/config/shared_pref.dart';
import 'package:babalomoda/feature/home/data/data_source/local_home_data_source.dart';
import 'package:babalomoda/feature/home/data/model/top_story_model.dart';
import 'package:babalomoda/feature/home/data/repositories/home_respositories.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  DataState dataState = DataState.notSet;
  bool isGrid = false;
  TextEditingController searchController = TextEditingController();

  List<TopStoryModel> topStories = [];
  List<String> allSections = [];
  String message = '', selectedSection = '';

  final HomeRepositories _homeRepositories = HomeRepositories();

  void changeListView({required bool gridVal}) {
    isGrid = gridVal;
    Preferences.prefs!.setBool('is_grid', isGrid);
    notifyListeners();
  }

  void changeSearch(String srch) {
  final int previousCursorPosition = searchController.selection.baseOffset;
  searchController.text = srch;
  final newCursorPosition = previousCursorPosition + (srch.length - searchController.text.length);
  searchController.selection = TextSelection.fromPosition(
    TextPosition(offset: newCursorPosition),
  );
  notifyListeners();
}


  void clearSearch() {
    searchController.clear();
    notifyListeners();
  }

  Future<void> getTopStories({
    required String section,
  }) async {
    topStories = [];
    dataState = DataState.loading;
    notifyListeners();
    List<TopStoryModel> localStories;

    final jsonString = Preferences.prefs!.getString('CACHED_STORIES-$section');

    if (jsonString != null) {
      localStories =
          await HomeLocalDataSource().getCachedStories(section: section);
      topStories = localStories;
      notifyListeners();
    }

    CacheResponse.cacheableResopnseMethod(() async {
      final result = await _homeRepositories.getTopStories(section: section);
      result.fold((failure) {
        dataState = DataState.faild;
        message = failure.message;
        print(failure.message + '55555555555555');
        notifyListeners();
      }, (remoteData) async {
        dataState = DataState.done;
        topStories = remoteData;
        notifyListeners();
      });
    });
  }

  void getAllSection() {
    allSections = [];
    for (var story in topStories) {
      if (!allSections.contains(story.section)) {
        allSections.add(story.section);
      }
    }
    notifyListeners();
  }

  void chageSection(String sec) {
    if (sec == selectedSection) {
      selectedSection = '';
    } else {
      selectedSection = sec;
    }
    notifyListeners();
  }
}

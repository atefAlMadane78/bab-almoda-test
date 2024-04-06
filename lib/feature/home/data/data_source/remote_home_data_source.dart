import 'package:babalomoda/core/error/exceptions.dart';
import 'package:babalomoda/core/network/dio_helper.dart';
import 'package:babalomoda/feature/home/data/model/top_story_model.dart';

class HomeRemoteDataSource {
  Future<List<TopStoryModel>> getAllStore({String? section}) async {
    const apiKey = 'GWUtNgnP7FSAjmcEJlelKcaAHJWKXzSy';
    final response = await DioHelper.getData(
        url: 'topstories/v2/${section ?? 'home'}.json?api-key=$apiKey');
    final result = response.data as Map;

    if (result.containsKey('status')&& result['status']== 'OK') {
      final List data = result['results'];
      if (data.isEmpty) {
        throw EmptyServerListException();
      }
      final stories =
          data.map<TopStoryModel>((story) => TopStoryModel.fromJson(story)).toList();
      return stories;
    } else {
      throw ServerException(message: result['message'] ?? "");
    }
  }
}

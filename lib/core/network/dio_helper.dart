import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://api.nytimes.com/svc/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String url,
    query,
    lang = 'en',
    token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
    };

    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    query,
    data,
    token,
  }) async {
    dio.options.headers = {
      'Content-Type': ' application/json; charset=utf-8',
    };

    return dio.post(url, queryParameters: query, data: data);
  }

  static Future<Response> putData({
    required String url,
    query,
    data,
    token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
    return dio.put(url, queryParameters: query, data: data);
  }

  static Future<Response> deletData({
    required String url,
    query,
    required Map<String, dynamic> data,
    token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
    };

    return dio.delete(url, queryParameters: query, data: data);
  }
}

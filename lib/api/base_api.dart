import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:maxnews/models/news.dart';

class BaseApi {
  static Dio dio = Dio();

  static var apiKey = 'fd0a9a8ad0ec4a549660ed0b528002e0';
  static var newsQueryParameters = {
    'apikey': apiKey,
  };
  static var newsBaseApi = 'https://newsapi.org/v2/top-headlines';
  static var nationalNewsApi = '?country=id';
  static var internationalNewsApi = '?country=us';
  static var businessNewsApi = '?category=business&country=id';

  static String nationalTitle = 'National';
  static String internationalTitle = 'International';
  static String businessTitle = 'Business';

  static String getCategory(String content) {
    if (content == nationalTitle) {
      return nationalNewsApi;
    } else if (content == internationalTitle) {
      return internationalNewsApi;
    } else if (content == businessTitle) {
      return businessNewsApi;
    } else {
      return '';
    }
  }

  static Future<News?> getNews(String content) async {
    var api = newsBaseApi + getCategory(content);
    try {
      var response = await dio.get(
        api,
        queryParameters: newsQueryParameters,
      );

      if (kDebugMode) {
        print(api);
        print('Status Code : ${response.statusCode}');
      }

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data);
        }
        var list = News.fromJson(response.data);
        return list;
      } else {
        return null;
      }
    } on DioError {
      Get.snackbar('Get Data', 'Something went wrong on DioError');
      return null;
    } catch (e) {
      Get.snackbar('Get Data', 'Something went wrong');
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }
}

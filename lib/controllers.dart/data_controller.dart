import 'package:get/get.dart';
import 'package:maxnews/api/base_api.dart';
import 'package:maxnews/models/news.dart';

class DataController extends GetxController {
  var query = ''.obs;
  var category = ''.obs;
  var pageIndex = 0.obs;
  Rx<News> listNews = News().obs;
  var searchLoading = false.obs;

  Future<News?> getNews(String content) async {
    var response = await BaseApi.getNews(content);

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }
}

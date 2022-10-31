import 'package:get/get.dart';
import 'package:maxnews/api/base_api.dart';
import 'package:maxnews/models/news.dart';

class DataController extends GetxController {
  var query = ''.obs;
  var pageIndex = 0.obs;
  Rx<News> listNews = News().obs;
  var searchLoading = false.obs;
  var loadingPercentage = 0.obs;

  Future<News?> getNews(String content) async {
    var response = await BaseApi.getNews(content);

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }

  Future<News?> searchNews(String content) async {
    searchLoading.value = true;
    var response = await BaseApi.getNews(content);

    if (response != null) {
      listNews.value = response;
      searchLoading.value = false;
      return response;
    } else {
      listNews.value = News();
      searchLoading.value = false;
      return null;
    }
  }
}

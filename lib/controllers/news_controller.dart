import 'package:get/get.dart';
import 'package:servislet_case/constants/appConstant.dart';
import 'package:servislet_case/models/new.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsController extends GetxController {
  final RxList<New> news = <New>[].obs;

  Future<void> fetchNews() async {
    final url = Uri.parse(newsUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['articles'];
      final List<New> loadedNews = [];
      data.forEach((element) {
        loadedNews.add(New(
          title: element['title'],
          description: element['description'],
          url: element['url'],
          urlToImage: element['urlToImage'],
          content: element['content'],
          publishedAt: element['publishedAt'],
        ));
        news.assignAll(loadedNews);
      });
    } else {
      throw Exception('Failed to load news');
    }
  }
}

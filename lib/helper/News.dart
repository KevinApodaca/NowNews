import 'dart:convert';

import 'package:NowNews/models/ArticleModel.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=us&apiKey=0d3ed5e9318e4cafb586d3be507d99c3";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = new ArticleModel(
              title: element['title'],
              author: element['author'],
              desc: element['description'],
              content: element['context'],
              url: element['url'],
              urlToImage: element['urlToImage']);
          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=0d3ed5e9318e4cafb586d3be507d99c3";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = new ArticleModel(
              title: element['title'],
              author: element['author'],
              desc: element['description'],
              content: element['context'],
              url: element['url'],
              urlToImage: element['urlToImage']);
          news.add(articleModel);
        }
      });
    }
  }
}

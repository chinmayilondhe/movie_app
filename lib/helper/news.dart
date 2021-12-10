import 'dart:convert';

import 'package:news_api/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=0a726d4dbb664cc485326f7e537e2596";

    http.Response response;
    response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body);
    if (data['status'] == "ok") {
      data['articles'].forEach((ele) {
        if (ele['description'] != null && ele['urlToImage'] != null) {
          ArticleModel articleModel = ArticleModel(
              author: ele["author"] ,
              title: ele["title"] ,
              desc: ele["description"] ,
              url: ele["url"],
              urlToImage: ele["urlToImage"],
              content: ele["content"]);
          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsclass {
  
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?category=$category&country=in&apiKey=0a726d4dbb664cc485326f7e537e2596";

    http.Response response;
    response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body);
    if (data['status'] == "ok") {
      data['articles'].forEach((ele) {

        if (ele['description'] != null && ele['urlToImage'] != " ") {
          ArticleModel articleModel = ArticleModel(
              author: ele["author"] ,
              title: ele["title"] ,
              desc: ele["description"] ,
              url: ele["url"],
              urlToImage: ele["urlToImage"],
              content: ele["content"]);
          news.add(articleModel);
        }
      });
    }
  }
}

class SearchNews {
  
  List<ArticleModel> news = [];

  Future<void> getNews(String search) async {
    String url =
        "https://newsapi.org/v2/top-headlines?q=$search&apiKey=0a726d4dbb664cc485326f7e537e2596";

    http.Response response;
    response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body);
    if (data['status'] == "ok") {
      data['articles'].forEach((ele) {
        if (ele['description'] != null && ele['urlToImage'] != " ") {


          ArticleModel articleModel = ArticleModel(
              author: ele["author"] ,
              title: ele["title"] ,
              desc: ele["description"] ,
              url: ele["url"],
              urlToImage: ele["urlToImage"],
              content: ele["content"]);
          news.add(articleModel);
        }
      });
    }
  }

}




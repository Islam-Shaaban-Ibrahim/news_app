import 'package:flutter/material.dart';
import 'package:news_app/models/news_response/article.dart';
import 'package:news_app/news/data/repository/news_repository.dart';
import 'package:news_app/shared/service_locator.dart';

class NewsViewModel extends ChangeNotifier {
  late final NewsRepository repository;
  NewsViewModel() {
    repository = NewsRepository(ServiceLocator.newsDataSource);
  }
  List<Article>? newsList;
  String? errorMessage;
  Future<void> getNews(String sourceId) async {
    try {
      newsList = await repository.getNews(sourceId);
    } catch (e) {
      errorMessage = 'failed to load news';
    }
    notifyListeners();
  }
}

import 'package:news_app/shared/api_manager.dart';
import 'package:news_app/models/news_response/article.dart';
import 'package:news_app/news/data/data_source/news_data_source.dart';

class NewsApiDataSource implements NewsDataSource {
  @override
  Future<List<Article>> getNews(String sourceId, {int page = 1}) async {
    final newsResponse = await ApiManager.getAllNews(sourceId);
    if (newsResponse?.status == 'ok' && newsResponse?.articles != null) {
      return newsResponse!.articles!;
    } else {
      throw Exception('failed to get news');
    }
  }
}

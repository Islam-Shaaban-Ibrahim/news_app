import 'package:news_app/models/news_response/article.dart';
import 'package:news_app/news/data/data_source/news_data_source.dart';

class NewsRepository {
  final NewsDataSource dataSource;
  NewsRepository(this.dataSource);
  Future<List<Article>> getNews(String sourceId) async {
    return await dataSource.getNews(sourceId);
  }
}

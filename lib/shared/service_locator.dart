import 'package:news_app/api/sources/data/data_source/sources_api_data_source.dart';
import 'package:news_app/api/sources/data/data_source/sources_data_source.dart';
import 'package:news_app/news/data/data_source/news_api_data_source.dart';
import 'package:news_app/news/data/data_source/news_data_source.dart';

class ServiceLocator {
  static final SourcesDataSource sourcesDataSource = SourcesApiDataSource();
  static final NewsDataSource newsDataSource = NewsApiDataSource();
}

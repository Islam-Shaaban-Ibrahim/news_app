import 'package:news_app/api/sources/data/data_source/sources_data_source.dart';
import 'package:news_app/models/source_response/source.dart';

class SourcesRepository {
  final SourcesDataSource dataSource;
  SourcesRepository(this.dataSource);
  Future<List<Source>> getSources(String categoryId) async {
    return await dataSource.getSources(categoryId);
  }
}

import 'package:news_app/shared/api_manager.dart';
import 'package:news_app/api/sources/data/data_source/sources_data_source.dart';
import 'package:news_app/models/source_response/source.dart';

class SourcesApiDataSource implements SourcesDataSource {
  @override
  Future<List<Source>> getSources(String categoryId) async {
    final sourcesResponse = await ApiManager.getAllSources(categoryId);
    if (sourcesResponse?.status == 'ok' && sourcesResponse?.sources != null) {
      return sourcesResponse!.sources!;
    } else {
      throw Exception('failed to get sources');
    }
  }
}

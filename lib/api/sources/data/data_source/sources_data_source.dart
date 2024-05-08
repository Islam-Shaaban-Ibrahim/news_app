import 'package:news_app/models/source_response/source.dart';

abstract class SourcesDataSource {
  Future<List<Source>> getSources(String categoryID);
}

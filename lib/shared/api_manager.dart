import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/shared/api_constants.dart';
import 'package:news_app/models/news_response/news_response.dart';
import 'package:news_app/models/source_response/source_response.dart';

class ApiManager {
  static Future<SourceResponse?> getAllSources(String categoryId) async {
    final url = Uri.https(ApiConstants.baseUrl, ApiConstants.sourcesEndPoint, {
      'apiKey': ApiConstants.apiKey,
      'category': categoryId,
    });

    final response = await http.get(url);
    final json = jsonDecode(response.body);

    return SourceResponse.fromJson(json);
  }

  static Future<NewsResponse?> getAllNews(String sourceId,
      {int page = 1}) async {
    final url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsEndPoint, {
      'apiKey': ApiConstants.apiKey,
      'sources': sourceId,
      'pageSize': 10.toString(),
      'page': page.toString()
    });

    try {
      final response = await http.get(url);
      final json = jsonDecode(response.body);

      return NewsResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  static Future<NewsResponse?> searchForTopics(String query) async {
    final url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsEndPoint, {
      'apiKey': ApiConstants.apiKey,
      'q': '+$query',
    });
    try {
      final response = await http.get(url);
      final json = jsonDecode(response.body);

      return NewsResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}

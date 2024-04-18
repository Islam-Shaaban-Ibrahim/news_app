import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/source_response/source_response.dart';

class ApiManager {
  static Future<SourceResponse>? getAllSources() async {
    final url = Uri.https('newsapi.org', '/v2/top-headlines/sources',
        {'apiKey': 'aad334ca9ed74429b9e2eff84080ac64'});
    try {
      final response = await http.get(url);
      final json = jsonDecode(response.body);

      return SourceResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/models/source_response/source.dart';

class CategoryViewModel extends ChangeNotifier {
  List<Source>? sources;
  String? errorMessage;

  Future<void> getSources(String categoryId) async {
    sources = null;
    errorMessage = null;
    notifyListeners();
    try {
      final response = await ApiManager.getAllSources(categoryId);
      if (response?.status != 'ok') {
        errorMessage = response?.message;
      } else {
        sources = response!.sources;
        notifyListeners();
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}

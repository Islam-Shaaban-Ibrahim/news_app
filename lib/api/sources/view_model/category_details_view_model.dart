import 'package:flutter/material.dart';
import 'package:news_app/api/sources/data/repository/sources_repository.dart';
import 'package:news_app/models/source_response/source.dart';
import 'package:news_app/shared/service_locator.dart';

class CategoryViewModel extends ChangeNotifier {
  late final SourcesRepository repository;
  CategoryViewModel() {
    repository = SourcesRepository(ServiceLocator.sourcesDataSource);
  }
  List<Source>? sources;
  String? errorMessage;

  Future<void> getSources(String categoryId) async {
    sources = null;
    errorMessage = null;
    notifyListeners();
    try {
      sources = await repository.getSources(categoryId);
    } catch (e) {
      errorMessage = "Error loading sources";
    }
    notifyListeners();
  }
}

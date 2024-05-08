import 'package:flutter/material.dart';
import 'package:news_app/shared/app_theme.dart';
import 'package:news_app/search/search_result.dart';

class AppSearchBar extends SearchDelegate {
  @override
  TextStyle? get searchFieldStyle => TextStyle(
        color: MyAppTheme.blackColor,
        fontSize: 20,
      );
  @override
  InputDecorationTheme? get searchFieldDecorationTheme =>
      const InputDecorationTheme(
        outlineBorder: BorderSide(color: Colors.black),
        border: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.black,
        )),
      );
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: const Icon(Icons.clear_sharp),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchResult(
      query: query,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Text('');
  }
}

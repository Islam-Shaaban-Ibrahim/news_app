import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/category/tab_bar_widget.dart';
import 'package:news_app/models/category_model.dart';

class CategoryDetails extends StatefulWidget {
  final CategoryDM category;
  const CategoryDetails({super.key, required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getAllSources(widget.category.categoryId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: MyAppTheme.primaryColor),
            );
          } else if (snapshot.hasError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Something went wrong please\n             check your\n      internet connection',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    ApiManager.getAllSources(widget.category.categoryId);
                    setState(() {});
                  },
                  child: const Text('Try again'),
                )
              ],
            );
          } else if (snapshot.data?.status != 'ok') {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(snapshot.data?.message ?? '',
                    style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    ApiManager.getAllSources(widget.category.categoryId);
                    setState(() {});
                  },
                  child: const Text('Try again'),
                )
              ],
            );
          } else {
            var sourcesList = snapshot.data?.sources ?? [];
            return DefaultTabBarWidget(
              sources: sourcesList,
            );
          }
        });
  }
}

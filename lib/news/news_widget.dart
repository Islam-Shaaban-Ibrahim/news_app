import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/models/news_response/article.dart';
import 'package:news_app/news/news_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'news_content.dart';

class NewsWidget extends StatefulWidget {
  final String sourceId;
  const NewsWidget({super.key, required this.sourceId});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  int page = 1;
  final listController = ScrollController();
  List<Article> articlesList = [];
  bool reachedEnd = false;

  @override
  void initState() {
    listController.addListener(() {
      if (listController.position.atEdge && articlesList.length % 10 == 0) {
        bool isEnd = listController.position.pixels == 0;
        if (!isEnd) {
          reachedEnd = true;
          setState(() {});
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (reachedEnd) {
      ApiManager.getAllNews(widget.sourceId, page: ++page).then((value) {
        articlesList.addAll(value?.articles ?? []);
        setState(() {});
      });

      reachedEnd = false;
    }

    return FutureBuilder(
        future: ApiManager.getAllNews(
          widget.sourceId,
        ),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
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
                    ApiManager.getAllNews(
                      widget.sourceId,
                    );
                    setState(() {});
                  },
                  child: const Text('Try again'),
                )
              ],
            );
          }
          if (snapshot.hasData) {
            var newsList = snapshot.data?.articles ?? [];
            if (articlesList.isEmpty) {
              articlesList = newsList;
            }
            if (articlesList.isNotEmpty && newsList.isNotEmpty) {
              if (articlesList.first.source?.id != newsList.first.source?.id) {
                articlesList = newsList;
                page = 1;
                Future.delayed(const Duration(microseconds: 5), () {
                  listController.jumpTo(0);
                });
              }
            }
            return newsList.isEmpty
                ? Center(
                    child: Text(
                    AppLocalizations.of(context)?.no_news ?? '',
                    style: Theme.of(context).textTheme.titleMedium,
                  ))
                : ListView.builder(
                    controller: listController,
                    itemCount: articlesList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                NewsContentScreen.routeName,
                                arguments: articlesList[index]);
                          },
                          child: NewsItem(article: articlesList[index]));
                    },
                  );
          } else {
            return Center(
              child: CircularProgressIndicator(color: MyAppTheme.primaryColor),
            );
          }
        });
  }

  @override
  void dispose() {
    listController.dispose();
    super.dispose();
  }
}

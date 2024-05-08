import 'package:flutter/material.dart';
import 'package:news_app/shared/api_manager.dart';
import 'package:news_app/shared/app_theme.dart';
import 'package:news_app/models/news_response/article.dart';
import 'package:news_app/news/view/news_content.dart';
import 'package:news_app/news/view/news_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/news/view_model/news_view_model.dart';
import 'package:provider/provider.dart';

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
  final viewModel = NewsViewModel();

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
    if (!reachedEnd) {
      viewModel.getNews(widget.sourceId);
    }
    if (reachedEnd) {
      ApiManager.getAllNews(widget.sourceId, page: ++page).then((value) {
        articlesList.addAll(value?.articles ?? []);
        setState(() {});
      });

      reachedEnd = false;
    }

    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<NewsViewModel>(
        builder: (context, value, child) {
          if (viewModel.errorMessage != null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    viewModel.errorMessage!,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    viewModel.newsList = null;
                    viewModel.errorMessage = null;
                    viewModel.getNews(
                      widget.sourceId,
                    );
                    setState(() {});
                  },
                  child: const Text('Try again'),
                )
              ],
            );
          } else if (viewModel.newsList == null) {
            return Center(
              child: CircularProgressIndicator(color: MyAppTheme.primaryColor),
            );
          } else {
            var newsList = viewModel.newsList ?? [];
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
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    listController.dispose();
    super.dispose();
  }
}

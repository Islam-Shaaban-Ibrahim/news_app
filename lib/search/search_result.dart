import 'package:flutter/material.dart';
import 'package:news_app/shared/api_manager.dart';
import 'package:news_app/shared/app_theme.dart';
import 'package:news_app/news/view/news_content.dart';
import 'package:news_app/news/view/news_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchResult extends StatefulWidget {
  final String query;
  const SearchResult({super.key, required this.query});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.searchForTopics(widget.query),
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
                    ApiManager.searchForTopics(widget.query);
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
                    ApiManager.searchForTopics(widget.query);
                    setState(() {});
                  },
                  child: const Text('Try again'),
                )
              ],
            );
          } else {
            var newsList = snapshot.data?.articles ?? [];
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/background.png'))),
              child: newsList.isEmpty
                  ? Center(
                      child: Text(
                        AppLocalizations.of(context)?.no_results ?? '',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    )
                  : ListView.builder(
                      itemCount: newsList.length,
                      itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                NewsContentScreen.routeName,
                                arguments: newsList[index]);
                          },
                          child: NewsItem(article: newsList[index])),
                    ),
            );
          }
        });
  }
}

import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/news/news_item.dart';
import 'package:news_app/models/source_response/source.dart';

class NewsWidget extends StatefulWidget {
  final Source source;
  const NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getAllNews(widget.source.id ?? ''),
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
                    ApiManager.getAllNews(widget.source.id ?? '');
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
                    ApiManager.getAllNews(widget.source.id ?? '');
                    setState(() {});
                  },
                  child: const Text('Try again'),
                )
              ],
            );
          } else {
            var newsList = snapshot.data?.articles ?? [];
            return ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index) =>
                  NewsItem(article: newsList[index]),
            );
          }
        });
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/models/news_response/article.dart';
import 'package:intl/intl.dart';
import 'package:news_app/news/news_content.dart';

class NewsItem extends StatelessWidget {
  final Article article;
  final String? content;
  final format = DateFormat('h');
  NewsItem({super.key, required this.article, this.content});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(NewsContentScreen.routeName, arguments: article);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                imageUrl: article.urlToImage ?? '',
                placeholder: (_, __) => Center(
                    child: CircularProgressIndicator(
                  color: MyAppTheme.primaryColor,
                )),
                errorWidget: (_, __, ___) =>
                    Image.asset('assets/images/no image.jpg'),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              article.author ?? '',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: MyAppTheme.greyColor, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(article.title ?? '',
                style: Theme.of(context).textTheme.titleMedium),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Text(
                ' ${format.format(DateTime.parse(article.publishedAt ?? ''))} Hours',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: MyAppTheme.greyColor, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(content ?? '',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

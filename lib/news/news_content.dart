import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/models/news_response/article.dart';
import 'package:news_app/news/news_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewsContentScreen extends StatelessWidget {
  static const String routeName = 'news_content';
  const NewsContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Article;
    return Container(
      decoration: BoxDecoration(
        color: MyAppTheme.whiteColor,
        image: const DecorationImage(
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
          image: AssetImage('assets/images/background.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            title: Text(AppLocalizations.of(context)?.news_content ?? '',
                style: Theme.of(context).textTheme.titleLarge)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              NewsItem(
                article: args,
                content: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.17,
                    child: Text(
                      overflow: TextOverflow.visible,
                      args.description ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontSize: 16),
                    )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              GestureDetector(
                onTap: () {
                  viewFullArticle(args.url ?? '');
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        AppLocalizations.of(context)?.view_full_article ?? '',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: MyAppTheme.greyColor, fontSize: 18),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Icon(
                        (Icons.arrow_forward_ios_sharp),
                        size: 18,
                        color: MyAppTheme.greyColor,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> viewFullArticle(String urlString) async {
    try {
      final bool launched = await launchUrl(Uri.parse(urlString));
      if (!launched) {
        throw 'Failed to launch $urlString';
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

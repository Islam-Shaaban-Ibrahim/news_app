import 'package:flutter/material.dart';

import 'package:news_app/shared/app_theme.dart';
import 'package:news_app/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/news/view/news_content.dart';
import 'package:news_app/settings/setting_provider.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SettingsProvider()..getAllPrefs(),
      child: const NewsApp()));
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: MyAppTheme.lightTheme,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        NewsContentScreen.routeName: (context) => const NewsContentScreen(),
      },
      locale: Locale(settingsProvider.appLanguage),
    );
  }
}

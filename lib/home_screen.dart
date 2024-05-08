import 'package:flutter/material.dart';
import 'package:news_app/search/search_bar_widget.dart';
import 'package:news_app/settings/setting_screen.dart';

import 'package:news_app/shared/app_theme.dart';
import 'package:news_app/api/sources/view/category_details.dart';
import 'package:news_app/category/category_grid.dart';

import 'package:news_app/home_drawer.dart';
import 'package:news_app/models/category_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: AppSearchBar());
                },
                icon: const Icon(Icons.search))
          ],
          title: selectedWidget == DrawerOptions.settings
              ? Text(AppLocalizations.of(context)!.settings,
                  style: Theme.of(context).textTheme.titleLarge)
              : category == null
                  ? Text(AppLocalizations.of(context)?.news ?? '',
                      style: Theme.of(context).textTheme.titleLarge)
                  : Text(category!.categoryName,
                      style: Theme.of(context).textTheme.titleLarge),
        ),
        body: category != null
            ? CategoryDetails(
                category: category!,
              )
            : selectedWidget == DrawerOptions.categories
                ? CategoryGrid(
                    onSelectedCategory: onCategoryClicked,
                  )
                : const SettingsScreen(),
        drawer: DrawerWidget(selectedOption: onOptionClicked),
      ),
    );
  }

  CategoryDM? category;
  var selectedWidget = DrawerOptions.categories;
  void onOptionClicked(DrawerOptions drawerOptions) {
    selectedWidget = drawerOptions;
    category = null;
    setState(() {});
    Navigator.pop(context);
  }

  void onCategoryClicked(CategoryDM newCategory) {
    category = newCategory;
    setState(() {});
  }
}

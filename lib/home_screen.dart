import 'package:flutter/material.dart';
import 'package:news_app/api/setting_screen.dart';

import 'package:news_app/app_theme.dart';
import 'package:news_app/category/category_details.dart';
import 'package:news_app/category/category_grid.dart';

import 'package:news_app/home_drawer.dart';
import 'package:news_app/models/category_model.dart';

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
          title: selectedWidget == DrawerOptions.settings
              ? Text("Settings", style: Theme.of(context).textTheme.titleLarge)
              : category == null
                  ? Text("News App",
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

import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/app_theme.dart';

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
              title: Text(
            "News App",
            style: Theme.of(context).textTheme.titleLarge,
          )),
          body: FutureBuilder(
              future: ApiManager.getAllSources(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                        color: MyAppTheme.primaryColor),
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data?.sources?.length,
                      itemBuilder: (context, index) =>
                          Text(snapshot.data?.sources?[index].name ?? ''));
                }
              }),
        ));
  }
}

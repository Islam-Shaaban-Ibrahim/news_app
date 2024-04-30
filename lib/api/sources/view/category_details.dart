import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/api/sources/view_model/category_details_view_model.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/category/tab_bar_widget.dart';
import 'package:news_app/models/category_model.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  final CategoryDM category;
  const CategoryDetails({super.key, required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  int selectedIndex = 0;
  final viewModel = CategoryViewModel();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    viewModel.getSources(widget.category.categoryId);
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<CategoryViewModel>(builder: (context, value, child) {
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
                    viewModel.getSources(widget.category.categoryId);
                    setState(() {});
                  },
                  child: const Text('Try again'),
                )
              ],
            );
          } else if (viewModel.sources == null) {
            return Center(
              child: CircularProgressIndicator(color: MyAppTheme.primaryColor),
            );
          } else {
            return DefaultTabBarWidget(
              sources: viewModel.sources!,
            );
          }
        }));

    // FutureBuilder(
    //     future: ApiManager.getAllSources(widget.category.categoryId),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return Center(
    //           child: CircularProgressIndicator(color: MyAppTheme.primaryColor),
    //         );
    //       } else if (snapshot.hasError) {
    //         return Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Center(
    //               child: Text(
    //                 'Something went wrong please\n             check your\n      internet connection',
    //                 style: Theme.of(context).textTheme.bodyLarge,
    //               ),
    //             ),
    //             const SizedBox(
    //               height: 15,
    //             ),
    //             ElevatedButton(
    //               onPressed: () {
    //                 ApiManager.getAllSources(widget.category.categoryId);
    //                 setState(() {});
    //               },
    //               child: const Text('Try again'),
    //             )
    //           ],
    //         );
    //       } else if (snapshot.data?.status != 'ok') {
    //         return Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             Text(snapshot.data?.message ?? '',
    //                 style: Theme.of(context).textTheme.bodyLarge),
    //             const SizedBox(
    //               height: 15,
    //             ),
    //             ElevatedButton(
    //               onPressed: () {
    //                 ApiManager.getAllSources(widget.category.categoryId);
    //                 setState(() {});
    //               },
    //               child: const Text('Try again'),
    //             )
    //           ],
    //         );
    //       } else {
    //         var sourcesList = snapshot.data?.sources ?? [];
    //         return DefaultTabBarWidget(
    //           sources: sourcesList,
    //         );
    //       }
    //     });
  }
}

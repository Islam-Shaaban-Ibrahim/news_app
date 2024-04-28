import 'package:flutter/material.dart';
import 'package:news_app/category/category_item.dart';
import 'package:news_app/models/category_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryGrid extends StatelessWidget {
  final Function(CategoryDM) onSelectedCategory;
  CategoryGrid({super.key, required this.onSelectedCategory});

  @override
  Widget build(BuildContext context) {
    List<CategoryDM> categories = [
      CategoryDM(
        categoryName: AppLocalizations.of(context)?.sports ?? '',
        imageName: 'assets/images/ball.png',
        categoryId: 'sports',
        color: const Color(0xffC91C22),
      ),
      CategoryDM(
        categoryName: AppLocalizations.of(context)?.general ?? '',
        imageName: 'assets/images/Politics.png',
        categoryId: 'general',
        color: const Color(0xff003E90),
      ),
      CategoryDM(
        categoryName: AppLocalizations.of(context)?.health ?? '',
        imageName: 'assets/images/health.png',
        categoryId: 'health',
        color: const Color(0xffED1E79),
      ),
      CategoryDM(
        categoryName: AppLocalizations.of(context)?.business ?? '',
        imageName: 'assets/images/bussines.png',
        categoryId: 'business',
        color: const Color(0xffCF7E48),
      ),
      CategoryDM(
        categoryName: AppLocalizations.of(context)?.entertainment ?? '',
        imageName: 'assets/images/environment.png',
        categoryId: 'entertainment',
        color: const Color(0xff4882CF),
      ),
      CategoryDM(
        categoryName: AppLocalizations.of(context)?.science ?? '',
        imageName: 'assets/images/science.png',
        categoryId: 'science',
        color: const Color(0xffF2D352),
      ),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: MediaQuery.of(context).size.width * 0.12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)?.category_leading ?? '',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: const Color(0xff4F5A69), fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.85 / 1,
                crossAxisSpacing: 20,
                mainAxisSpacing: 15,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  onSelectedCategory(categories[index]);
                },
                child: CategoryItem(
                  category: categories[index],
                  index: index,
                ),
              ),
              itemCount: 6,
            ),
          ),
        ],
      ),
    );
  }
}

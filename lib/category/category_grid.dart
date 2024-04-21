import 'package:flutter/material.dart';
import 'package:news_app/category/category_item.dart';
import 'package:news_app/models/category_model.dart';

class CategoryGrid extends StatelessWidget {
  final Function(CategoryDM) onSelectedCategory;
  const CategoryGrid({super.key, required this.onSelectedCategory});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: MediaQuery.of(context).size.width * 0.12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pick your category\nof interest',
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
                  onSelectedCategory(CategoryDM.categories[index]);
                },
                child: CategoryItem(
                  category: CategoryDM.categories[index],
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

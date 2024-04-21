import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryDM category;
  final int index;
  const CategoryItem({required this.category, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: const Radius.circular(15),
          topLeft: const Radius.circular(15),
          bottomLeft: index.isOdd
              ? const Radius.circular(0)
              : const Radius.circular(15),
          bottomRight: index.isEven
              ? const Radius.circular(0)
              : const Radius.circular(15),
        ),
        color: category.color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            category.imageName,
            height: MediaQuery.of(context).size.height * 0.12,
            filterQuality: FilterQuality.high,
            fit: BoxFit.fill,
          ),
          Text(category.categoryName,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 20)),
        ],
      ),
    );
  }
}

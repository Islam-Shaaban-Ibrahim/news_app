import 'package:flutter/material.dart';

class CategoryDM {
  final String categoryName;
  final String imageName;
  final String categoryId;
  final Color color;

  CategoryDM(
      {required this.categoryName,
      required this.imageName,
      required this.categoryId,
      required this.color});

  static List<CategoryDM> categories = [
    CategoryDM(
      categoryName: 'Sports',
      imageName: 'assets/images/ball.png',
      categoryId: 'sports',
      color: const Color(0xffC91C22),
    ),
    CategoryDM(
      categoryName: 'General',
      imageName: 'assets/images/Politics.png',
      categoryId: 'general',
      color: const Color(0xff003E90),
    ),
    CategoryDM(
      categoryName: 'Health',
      imageName: 'assets/images/health.png',
      categoryId: 'health',
      color: const Color(0xffED1E79),
    ),
    CategoryDM(
      categoryName: 'Business',
      imageName: 'assets/images/bussines.png',
      categoryId: 'business',
      color: const Color(0xffCF7E48),
    ),
    CategoryDM(
      categoryName: 'Entertainment',
      imageName: 'assets/images/environment.png',
      categoryId: 'entertainment',
      color: const Color(0xff4882CF),
    ),
    CategoryDM(
      categoryName: 'Science',
      imageName: 'assets/images/science.png',
      categoryId: 'science',
      color: const Color(0xffF2D352),
    ),
  ];
}

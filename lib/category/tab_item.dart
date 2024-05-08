import 'package:flutter/material.dart';
import 'package:news_app/shared/app_theme.dart';
import 'package:news_app/models/source_response/source.dart';

class SourceTab extends StatelessWidget {
  final bool isSelected;
  final Source source;
  const SourceTab({super.key, required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
        decoration: BoxDecoration(
          border: Border.all(color: MyAppTheme.primaryColor, width: 2.5),
          borderRadius: BorderRadius.circular(20),
          color: isSelected ? MyAppTheme.primaryColor : MyAppTheme.whiteColor,
        ),
        child: Text(
          source.name ?? '',
          style: TextStyle(
              color:
                  isSelected ? MyAppTheme.whiteColor : MyAppTheme.primaryColor),
        ),
      ),
    );
  }
}

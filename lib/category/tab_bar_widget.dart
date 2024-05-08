import 'package:flutter/material.dart';
import 'package:news_app/news/view/news_widget.dart';
import 'package:news_app/category/tab_item.dart';
import 'package:news_app/models/source_response/source.dart';

class DefaultTabBarWidget extends StatefulWidget {
  final List<Source> sources;

  const DefaultTabBarWidget({super.key, required this.sources});

  @override
  State<DefaultTabBarWidget> createState() => _DefaultTabBarWidgetState();
}

class _DefaultTabBarWidgetState extends State<DefaultTabBarWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources.length,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          TabBar(
              indicatorColor: Colors.transparent,
              tabAlignment: TabAlignment.start,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              dividerColor: Colors.transparent,
              isScrollable: true,
              tabs: widget.sources
                  .map((source) => SourceTab(
                        source: source,
                        isSelected:
                            selectedIndex == widget.sources.indexOf(source),
                      ))
                  .toList()),
          Expanded(
              child:
                  NewsWidget(sourceId: widget.sources[selectedIndex].id ?? '')),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news/models/atriclesModel.dart';
import 'package:news/services/newsService.dart';
import 'package:news/widgets/newsCard.dart';

class NewsListView extends StatefulWidget {
  final String selectedCategory;
  final String selectedCountry; // Add selectedCountry parameter

  const NewsListView({
    Key? key,
    required this.selectedCategory,
    required this.selectedCountry,
  }) : super(key: key);

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  List<ArticelModel> data = [];

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  void didUpdateWidget(covariant NewsListView oldWidget) {
    if (oldWidget.selectedCategory != widget.selectedCategory ||
        oldWidget.selectedCountry != widget.selectedCountry) {
      getNews(); // Fetch new data when category or country changes
    }
    super.didUpdateWidget(oldWidget);
  }

  Future<void> getNews() async {
    data = await NewsService().getNews(
      widget.selectedCategory,
      widget.selectedCountry, // Pass selected country to getNews
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: NewsCard(articelModel: data[index]),
          );
        },
        childCount: data.length,
      ),
    );
  }
}

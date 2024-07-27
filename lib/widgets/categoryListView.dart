import 'package:flutter/material.dart';
import 'package:news/models/categoryModel.dart';
import 'package:news/widgets/categoryCard.dart';

class CategoryListView extends StatelessWidget {
  final Function(String) onSelectedCategory;

  CategoryListView({Key? key, required this.onSelectedCategory})
      : super(key: key);

  final List<CategoryModel> categories = [
    CategoryModel(name: "business", image: "images/buss.jpg"),
    CategoryModel(name: "entertainment", image: "images/entertaiment.jpg"),
    CategoryModel(name: "general", image: "images/black-smooth-textured-paper-background.jpg"),
    CategoryModel(name: "health", image: "images/health.jpg"),
    CategoryModel(name: "science", image: "images/science.jpg"),
    CategoryModel(name: "sports", image: "images/Goat.jpg"),
    CategoryModel(name: "technology", image: "images/tech.jpg")
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return CategoryCard(
            category: categories[index],
            onSelectedCategory:
                onSelectedCategory, // Pass the callback function to the CategoryCard
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
      ),
    );
  }
}

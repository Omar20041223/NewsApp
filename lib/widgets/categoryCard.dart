import 'package:flutter/material.dart';
import 'package:news/models/categoryModel.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final Function(String) onSelectedCategory;

  const CategoryCard(
      {Key? key, required this.category, required this.onSelectedCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          onSelectedCategory(category
              .name); // Call the callback function with the selected category name
        },
        child: Container(
          alignment: Alignment.bottomCenter,
          height: 120,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(category.image),
              fit: BoxFit.fill,
            ),
          ),
          child: Text(category.name, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}

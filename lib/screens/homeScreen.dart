import 'package:flutter/material.dart';
import 'package:news/widgets/categoryListView.dart';
import 'package:news/widgets/chooseCountry.dart';
import 'package:news/widgets/newsListView.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = "general"; // Initialize the selected category
  String selectedCountry = "us"; // Initialize the selected country

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("News",style: TextStyle(color: Colors.red),),
              Text("App",style: TextStyle(color: Colors.blue),)
            ],
          ),
          leading: ChooseCountry(
            onCountryChanged: (country) {
              setState(() {
                selectedCountry = country; // Update selected country
              });
            },
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CategoryListView(
                onSelectedCategory: (category) {
                  setState(() {
                    selectedCategory = category; // Update selected category
                  });
                },
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            NewsListView(
                selectedCategory: selectedCategory,
                selectedCountry: selectedCountry, // Pass selected country
              ),
          ],
        ),
      ),
    );
  }
}

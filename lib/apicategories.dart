import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Category {
  final int id;
  final String name;
  final String photoPath;

  Category({required this.id, required this.name, required this.photoPath});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      photoPath: json['photoPath'],
    );
  }
}

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Category> categories = [];

  Future<void> fetchCategories() async {
    final response = await http.get(Uri.parse('YOUR_API_ENDPOINT_HERE'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['categories'];
      setState(() {
        categories =
            data.map((category) => Category.fromJson(category)).toList();
      });
    } else {
      throw Exception('Failed to load categories');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categories[index].name),
            // You can add more widgets here like images, etc.
          );
        },
      ),
    );
  }
}

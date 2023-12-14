// import 'package:flutter/material.dart';

// class CategoryCard extends StatefulWidget {
//   const CategoryCard({super.key});
//   @override
//   State<CategoryCard> createState() => _CategoryCard();
// }

// class _CategoryCard extends State<CategoryCard> {
//   @override
//   Widget build(BuildContext context) {
//     return const Text('data');
//   }
// }
import 'package:flutter/material.dart';

class Category {
  const Category({
    required this.id,
    required this.title,
    this.color = Colors.blue,
  });

  final String id;
  final String title;
  final Color color;
}

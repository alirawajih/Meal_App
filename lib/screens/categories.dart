import 'package:flutter/material.dart';
import 'package:mealsapp/data/dummy_category.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/screens/meals.dart';
import 'package:mealsapp/widgets/category_card.dart';
import 'package:mealsapp/models/category.dart';

class CategriesScreen extends StatefulWidget {
  const CategriesScreen({super.key, required this.availabelMeal});
  final List<Meal> availabelMeal;

  @override
  State<CategriesScreen> createState() => _CategriesScreenState();
}

class _CategriesScreenState extends State<CategriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCatagory(BuildContext context, Category category) {
    final filtercategory = widget.availabelMeal
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(
              titel: category.title,
              meals: filtercategory,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView(
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: [
            for (final category in availableCategories)
              CategoryCard(
                category: category,
                onSelectCategory: () {
                  _selectCatagory(context, category);
                },
              )
          ],
        ),
      ),
      // //animation exampel
      // builder: (context, child) => Container(
      //   margin: EdgeInsets.only(
      //       top: 100 - _animationController.value * 100,
      //       left: 100 - _animationController.value * 100),
      //   child: child,
      // ),
      /////////////////////////////////////////////////////////////
      // builder: (context, child) => SlideTransition(
      //   position: _animationController.drive(
      //     Tween(
      //       begin: const Offset(0, .5),
      //       end: const Offset(0, 0),
      //     ),
      //   ),
      //   child: child,
      // ),
      //////////////////////////////////////////////////////////
      builder: (context, child) => SlideTransition(
        position: Tween(
          begin: const Offset(0, 0.9),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
              parent: _animationController, curve: Curves.easeInOut),
        ),
        child: child,
      ),
    );
  }
}

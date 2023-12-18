import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/screens/meal_details.dart';
import 'package:mealsapp/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.titel,
    required this.meals,
  });
  final String? titel;
  final List<Meal> meals;

  void onselectitem(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
              meal: meal,
            )));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: meals.length,
      itemBuilder: (ctx, index) => MealItem(
        meal: meals[index],
        onselectitem: (meal) => onselectitem(context, meal),
      ),
    );
    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('no data yet....',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
            const SizedBox(
              height: 14,
            ),
            Text(
              'try anther one ..',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            )
          ],
        ),
      );
    }
    if (titel == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(titel!),
      ),
      body: content,
    );
  }
}

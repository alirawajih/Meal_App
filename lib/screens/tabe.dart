import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:mealsapp/data/dummy_category.dart';
import 'package:mealsapp/providers/faverites_provider.dart';
import 'package:mealsapp/providers/filters_providers.dart';
import 'package:mealsapp/screens/categories.dart';
import 'package:mealsapp/screens/filters.dart';
import 'package:mealsapp/screens/meals.dart';
import 'package:mealsapp/screens/view.dart';
// import 'package:mealsapp/screens/user.dart';
// import 'package:mealsapp/screens/view.dart';
import 'package:mealsapp/widgets/main_drawer.dart';

const kinitialFilter = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false
};

class TabeScreen extends ConsumerStatefulWidget {
  const TabeScreen({super.key});
  @override
  ConsumerState<TabeScreen> createState() {
    return _TabeScreen();
  }
}

class _TabeScreen extends ConsumerState<TabeScreen> {
  int _selectpageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectpageIndex = index;
    });
  }

  void _setidentifier(String identifier) async {
    Navigator.of(context).pop();

    if (identifier == 'Filter') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(builder: (ctx) => const FiltersScreen()),
      );
    } else {
      // if (identifier == 'Meals') {
      //   Navigator.of(context)
      //       .push(MaterialPageRoute(builder: (ctx) => const TabeScreen()));
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    final filterMeal = ref.watch(mealFilter);

    final availabelMeals = filterMeal;
    Widget activePage = CategriesScreen(
      availabelMeal: availabelMeals,
    );
    String title = 'Categries';
    if (_selectpageIndex == 1) {
      final favertMeal = ref.watch(favertprovider);
      activePage = MealsScreen(
        meals: favertMeal,
      );
      title = 'Your Favorites';
    }

    if (_selectpageIndex == 2) {
      activePage = ViewScreen();
      title = 'web scren';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: MainDrawer(onselectidentifier: _setidentifier),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        currentIndex: _selectpageIndex,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'category'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.web), label: 'web '),
        ],
      ),
    );
  }
}

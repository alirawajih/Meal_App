import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/providers/meals_providers.dart';

enum Filter {
  glutenFree,
  vegan,
  vegetarian,
  lactoseFree,
}

class FilterProviderNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterProviderNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegan: false,
          Filter.vegetarian: false
        });
  void setFilters(Map<Filter, bool> chosenFilter) {
    state = chosenFilter;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filterProvider =
    StateNotifierProvider<FilterProviderNotifier, Map<Filter, bool>>((ref) {
  return FilterProviderNotifier();
});
final mealFilter = Provider((ref) {
  final meal = ref.watch(mealProviders);
  final activeFilters = ref.watch(filterProvider);
  return meal.where((meal) {
    if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
});

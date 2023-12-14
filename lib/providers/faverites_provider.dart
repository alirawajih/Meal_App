import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/models/meal.dart';

class FavertProviderNotifier extends StateNotifier<List<Meal>> {
  FavertProviderNotifier() : super([]);
  bool toggleMealFavoritsStatus(Meal meal) {
    final isExisting = state.contains(meal);

    if (isExisting) {
      state = state.where((element) => element.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favertprovider =
    StateNotifierProvider<FavertProviderNotifier, List<Meal>>(
  (ref) {
    return FavertProviderNotifier();
  },
);

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/data/dummy_category.dart';

final mealProviders = Provider((ref) {
  return dummyMeals;
});

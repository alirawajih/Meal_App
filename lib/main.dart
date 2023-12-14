import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:mealsapp/screens/categories.dart';
import 'package:mealsapp/screens/tabe.dart';
// import 'package:mealsapp/homepage.dart';
// import 'package:mealsapp/screens/meals.dart';
// import 'package:mealsapp/data/dummy_category.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: const Color.fromARGB(255, 51, 22, 4),
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: const CategriesScreen(),
      // home: const MealsScreen(titel: 'new', meals: dummyMeals),
      home: const TabeScreen(),
    );
  }
}



import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mealapp/categories_list.dart';
import 'package:mealapp/mainpage_bottomnavigationbar.dart';
import 'package:mealapp/Categories/categories_page.dart';
import 'package:mealapp/Filterspage.dart';
import 'package:mealapp/inseideCategory/inside_categories_page.dart';
import 'package:mealapp/RecipiDetails/mealrecipe_Details.dart';
import './classes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String,bool> setFilters ={
    'gluten' : false,
    'lactose' : false,
    'vegan' : false,
    'vegetarian' : false,
  };

  List <Meal> AvailableMeals = RecipesList;
  List <Meal> FavoritesMeals = [];

  void savedFilters(Map<String,bool> filterData){

    setState((){
      setFilters = filterData;
      AvailableMeals = RecipesList.where((meal) {
        if( setFilters['gluten'] == true && !meal.isGlutenFree)
          return false;
        if( setFilters['lactose'] == true && !meal.isLactoseFree)
          return false;
        if( setFilters['vegan'] == true && !meal.isVegan)
          return false;
        if( setFilters['vegetarian'] == true && !meal.isVegetarian)
          return false;

        else
          return true;
      }).toList();
    });
  }

  void toggleFavorite(String mealId){
    final existingIndex = FavoritesMeals.indexWhere((meal) => meal.id==mealId);
    if(existingIndex >= 0){
     return setState((){
        FavoritesMeals.removeAt(existingIndex);
      });
    } else
      return setState((){
        FavoritesMeals.add(RecipesList.firstWhere((meal) => meal.id == mealId));
      });
  }

  bool isFavmeal(String id){
    return FavoritesMeals.any((meal) => meal.id == id);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
      //home: categoriesPage(),
      routes:{
        '/' : (context) => mainPage(FavoritesMeals),
        insideCategories.routeName : (context) => insideCategories(AvailableMeals),
        recipeDetails.routeName : (context) => recipeDetails(isFavmeal,toggleFavorite),
        filtersPage.routeName : (context) => filtersPage(setFilters,savedFilters),
        categoriesPage.routeName : (context) => categoriesPage(),
        //favoritesPage.routeName : (context) => favoritesPage(),
        // mainPage.routeName : (context) => mainPage(),
      },
    );
  }
}

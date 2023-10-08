import 'package:flutter/material.dart';
import 'package:mealapp/categories_list.dart';
import 'package:mealapp/inseideCategory/inside_categories_page.dart';
import 'package:mealapp/inseideCategory/meal_recipe_tile.dart';
import '../classes.dart';

class categoriesShow extends StatelessWidget {
  final id;
  final String title;
  final Color color;
  categoriesShow(this.id, this.title, this.color);

  void selectedCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(insideCategories.routeName, arguments: {
      'title': title,
      'id': id,
      'color': color,
    });
  }

  @override
  Widget build(BuildContext context) {
    Meal firstMeal = RecipesList.firstWhere(
        (element) => element.categories.toString().contains(id));
    return InkWell(
      onTap: () => selectedCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              color.withOpacity(0.8),
              color,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: NetworkImage(firstMeal.imageUrl), fit: BoxFit.cover)),
        child: Container(
          margin: EdgeInsets.only(bottom: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(100)),
            color: Colors.black.withOpacity(0.8),
          ),
          height: 30,
          width: 150,
          child: Text(
            title,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

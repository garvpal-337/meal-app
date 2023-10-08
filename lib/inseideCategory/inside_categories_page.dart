import 'package:flutter/material.dart';
import './meal_recipe_tile.dart';
import '../classes.dart';

class insideCategories extends StatelessWidget {
  static const routeName = '/catscrn';
  List <Meal> AvailableMeals;
  insideCategories(this.AvailableMeals);
  //const insideCategories({Key? key}) : super(key: key);
  //final id;
  //final title;
  //insideCategories(this.id,this.title);

  @override
  Widget build(BuildContext context) {
    final routeArg = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
    final catTitle = routeArg['title'];
    final catId = routeArg['id'];
    final color = routeArg['color'];
    final recipeList = AvailableMeals.where((Meal) {
      return Meal.categories.contains(catId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle.toString()),
        centerTitle: true,
        backgroundColor:color,
      ),
      body: Container(
        child: ListView.builder(itemBuilder: (context,index){
          return Column(
            children: [
             mealRecipe(
                 id: recipeList[index].id,
                 title: recipeList[index].title,
                 ImageUrl: recipeList[index].imageUrl,
                 duration: recipeList[index].duration,
                 complexity: recipeList[index].complexity,
                 affordability: recipeList[index].affordability,
                 color: color,
             ),
            ],
          );
        },
        itemCount: recipeList.length,
          // padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
        ),
      )

    );
  }
}

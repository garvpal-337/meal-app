import 'package:flutter/material.dart';
import './classes.dart';
import 'inseideCategory/meal_recipe_tile.dart';

class favoritesPage extends StatelessWidget {

  List <Meal> FavoritesList;
  favoritesPage(this.FavoritesList);

  @override
  Widget build(BuildContext context) {
    if(FavoritesList.isEmpty) {
     return Center(
          child: Container(
            child: Text('No Favorite meal added yet'),
          )); } else
            return Container(
              child: ListView.builder(itemBuilder: (context,index){
                return Column(
                  children: [
                    mealRecipe(
                      id: FavoritesList[index].id,
                      title: FavoritesList[index].title,
                      ImageUrl: FavoritesList[index].imageUrl,
                      duration: FavoritesList[index].duration,
                      complexity: FavoritesList[index].complexity,
                      affordability: FavoritesList[index].affordability,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                );
              },
                itemCount: FavoritesList.length,
                // padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
              ),
            );

  }
}

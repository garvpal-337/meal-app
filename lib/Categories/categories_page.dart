import 'package:flutter/material.dart';
import 'package:mealapp/Categories/categories_design_tile.dart';
import '../categories_list.dart';
import '../classes.dart';

class categoriesPage extends StatelessWidget {
 // const categoriesPage({Key? key}) : super(key: key);
  static const routeName = '/categoriespage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(15),
        children: categoriesList.map((catData){
          return categoriesShow(catData.id,catData.title, catData.color);
        }).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          childAspectRatio: 3/1,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          mainAxisExtent: 150,
        ),
      ),
    );
  }
}

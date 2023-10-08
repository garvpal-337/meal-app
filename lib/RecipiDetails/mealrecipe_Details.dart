import 'package:flutter/material.dart';
import 'package:mealapp/categories_list.dart';

class recipeDetails extends StatefulWidget {
  static const routeName = '/mealrecepiedetails';

  Function toggleFav;
  Function isFav;
  recipeDetails(this.isFav, this.toggleFav);

  @override
  State<recipeDetails> createState() => _recipeDetailsState();
}

class _recipeDetailsState extends State<recipeDetails> {
  @override
  Widget build(BuildContext context) {
    final recipeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final recipeId = recipeArg['id'];
    final color = recipeArg['color'];
    final SelectedRecipe =
        RecipesList.firstWhere((recipe) => recipe.id == recipeId);

    Widget buildTitleContainer(BuildContext context, String title) {
      return Container(
        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              // bottomRight:  Radius.circular(50),
              topLeft: Radius.circular(60)),
          color: color,
        ),
        child: Text(title,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            )),
      );
    }

    Widget buildListContainer(BuildContext context, Widget child) {
      return Container(
        decoration: BoxDecoration(
            border: Border.all(color: color),
            borderRadius: const BorderRadius.only(
                //topRight: Radius.circular(20),

                )),
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        padding: const EdgeInsets.all(10),
        // height: height,
        child: child,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe'),
        backgroundColor: color,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              height: 300,
              width: double.infinity,
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                  child: Image.network(
                    SelectedRecipe.imageUrl,
                    fit: BoxFit.cover,
                  )),
            ),
            Container(
              height: 30,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    topRight: Radius.circular(30)),
                // color: color.withOpacity(0.5)
              ),
              child: Text(SelectedRecipe.title,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: color,
                  )),
            ),
            Divider(
              height: 5,
              thickness: 3,
              color: color.withOpacity(0.5),
              endIndent: 15,
              indent: 15,
            ),
            const SizedBox(
              height: 10,
            ),
            buildTitleContainer(context, 'Ingredients'),
            buildListContainer(
              context,
              Column(
                children: SelectedRecipe.ingredients.map((e) {
                  int index = SelectedRecipe.ingredients.indexOf(e);
                  return Card(
                    elevation: 3,
                    shadowColor: color,
                    color: color.withOpacity(0.8),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                          '${index + 1}. ${SelectedRecipe.ingredients[index]}',
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          )),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            buildTitleContainer(context, 'Steps'),
            buildListContainer(
                context,
                Column(
                  children: SelectedRecipe.steps.map((e) {
                    int index = SelectedRecipe.steps.indexOf(e);
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: color,
                            child: Text(
                              '# ${index + 1}',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          title: Text(SelectedRecipe.steps[index]),
                        ),
                        Divider(
                          //height: 3,
                          thickness: 1,
                          color: color,
                          //indent: 30,
                          //endIndent: 30,
                        ),
                      ],
                    );
                  }).toList(),
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: color,
        onPressed: () {
          widget.toggleFav(SelectedRecipe.id);
        }, // widget.toggleFav(SelectedRecipe.id),
        child: widget.isFav(SelectedRecipe.id)
            ? Icon(
                Icons.star_border_purple500,
                color: Colors.white,
                size: 35,
              )
            : Icon(
                Icons.star_border_purple500_sharp,
                color: Colors.white,
                size: 35,
              ),
        elevation: 6,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mealapp/Categories/categories_page.dart';
import 'package:mealapp/favorites_page.dart';
import 'package:mealapp/mainDrawer.dart';
import './classes.dart';


class mainPage extends StatefulWidget {
  List <Meal> FavMeal;
  mainPage(this.FavMeal);
  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {


  List <Map<String,dynamic>>? page;

  initState(){
    page = [
      {'page' : categoriesPage(), 'title': 'Categories'},
      {'page' : favoritesPage(widget.FavMeal), 'title' : ' Your Favorites'}
    ];
    super.initState();
  }
 int pageIndex = 0;
  Selecteditem(int index){
   setState((){
     pageIndex = index;
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(page![pageIndex]['title']),
        centerTitle:true,
      ),
      body: page![pageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: Selecteditem,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black38,
        currentIndex: pageIndex,
        type: BottomNavigationBarType.shifting,
        elevation: 20,

        items: [
          BottomNavigationBarItem(
            icon:Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.star_border_purple500),
            label: 'favorite',
          ),
        ],
      ),
      drawer: mainDrawer(),
      drawerEdgeDragWidth: 200,
    );
  }
}

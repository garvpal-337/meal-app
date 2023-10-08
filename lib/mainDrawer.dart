import 'package:flutter/material.dart';
import './mainpage_bottomnavigationbar.dart';
import 'package:mealapp/Filterspage.dart';

class mainDrawer extends StatelessWidget {
  const mainDrawer({Key? key}) : super(key: key);
  
  void openFilters(BuildContext context){
    Navigator.of(context).pushReplacementNamed(filtersPage.routeName);
  }
  void openCartegories(BuildContext context){
    Navigator.of(context).pushReplacementNamed('/');
  }

  Widget TileDesign({
  required String title,
    required IconData icon,
    required Function Taphandler,
}){
    return ListTile(
      tileColor: Colors.teal,
      leading: Icon(icon,color: Colors.white,),
      title: Text(title,
        style: TextStyle(
          color: Colors.white,
        ),),
      onTap: () => Taphandler(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 300,
      child: ListView(
        children: [
          Container(
            //margin: EdgeInsets.only(top: 0),
            color: Colors.teal,
            height: 150,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Let\'s Cook',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.white
                ),),
                Icon(Icons.cookie_outlined,color: Colors.white,)
              ],
            ),
          ),
          SizedBox(height: 10,),

          TileDesign(
              title: 'Meal category',
              icon: Icons.category,
              Taphandler: () => openCartegories(context)),

          Divider(
            height: 3,
            thickness: 1,
            color: Colors.white,
          ),
          TileDesign(title: 'Filters',
              icon: Icons.filter_tilt_shift,
              Taphandler: () => openFilters(context)),

        ],
      ),
    );
  }
}

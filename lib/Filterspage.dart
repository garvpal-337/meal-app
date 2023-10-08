import 'package:flutter/material.dart';
import 'package:mealapp/mainDrawer.dart';

class filtersPage extends StatefulWidget {
  static const routeName = '/filterspage';
  final Function SavedFilters;
   Map<String,bool> currentFilters;
  filtersPage(this.currentFilters,this.SavedFilters);

  @override
  State<filtersPage> createState() => _filtersPageState();
}

class _filtersPageState extends State<filtersPage> {

   bool _isGlutenFree = false;
   bool _isLactoseFree = false;
   bool _isVegan = false;
   bool _isVegetarian = false;


   @override
   initState(){
     _isGlutenFree = widget.currentFilters['gluten']!;
     _isLactoseFree = widget.currentFilters['lactose']!;
     _isVegan = widget.currentFilters['vegan']!;
     _isVegetarian = widget.currentFilters['vegetarian']!;
     super.initState();
   }


  /* Widget _buildSwitchTile({
     required String title,
     required String subtitle,
     required bool value,
     required Function onChange
}){
     return  SwitchListTile(
         value: value ,
         title: Text(title,
             style:TextStyle(
                 fontSize: 17,
                 fontWeight: FontWeight.w500
             )),
         subtitle: Text(subtitle),
         onChanged:(bool) => onChange(),

         );
   }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(onPressed: (){
            final savedData ={
              'gluten' : _isGlutenFree,
              'lactose' : _isLactoseFree,
              'vegan' : _isVegan,
              'vegetarian' : _isVegetarian,
            };

            widget.SavedFilters(savedData);
          },
              icon: Icon(Icons.save_rounded))
        ],
      ),
      drawer: mainDrawer(),
      drawerEdgeDragWidth: 200,
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
              padding: EdgeInsets.all(20),
          child: Text('Choose meals Accordingly',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600
          ),),),
        Divider(height: 10,
        thickness: 1,
        color: Theme.of(context).primaryColor,),

        SwitchListTile(
          value: _isGlutenFree ,
          title: Text('Gluteen Free',
              style:TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500
              )),
          subtitle: Text('Includes only Gluteen free meals'),
          onChanged:(bool? val){
            setState((){
              _isGlutenFree = val!;
            });
          },
        ),

          SwitchListTile(
            value: _isVegan ,
            title: Text('Vegan',
                style:TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500
                )),
            subtitle: Text('Includes only Vegan meals'),
            onChanged:(bool? val){
              setState((){
                _isVegan = val!;
              });
            },
          ),

          SwitchListTile(
            value: _isVegetarian ,
            title: Text('Vegitarian',
                style:TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500
                )),
            subtitle: Text('Includes only Vegitarian meals'),
            onChanged:(bool? val){
              setState((){
                _isVegetarian = val!;
              });
            },
          ),

          SwitchListTile(
            value: _isLactoseFree ,
            title: Text('Lactose Free',
                style:TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500
                )),
            subtitle: Text('Includes only Lactose free meals'),
            onChanged:(bool? val){
              setState((){
                _isLactoseFree = val!;
              });
            },
          ),

         ]
      )
    );
  }
}

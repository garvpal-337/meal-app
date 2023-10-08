import'package:flutter/material.dart';
import 'package:mealapp/RecipiDetails/mealrecipe_Details.dart';
import '../classes.dart';

class mealRecipe extends StatelessWidget {
  final String id;
  final String title;
  final String ImageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Color color;
  mealRecipe({
    required this.id,
    required this.title,
    required this.ImageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.color,

});

  String get ComplexityText{
     switch (complexity){
       case Complexity.Simple:
         return 'Simple';

       case Complexity.Challenging:
         return 'Challenging';

       case Complexity.Hard:
         return 'hard';
     }
  }

  String get AffordabilityText{
    switch (affordability){
      case Affordability.Affordable:
        return 'Affordable';

      case Affordability.Pricey:
        return 'Pricey';

      case Affordability.Luxurious:
        return 'Luxurious';
    }
  }

  void selectRecipe(BuildContext ctx){
    Navigator.of(ctx).pushNamed(recipeDetails.routeName,arguments: {
      'id' : id,
      'color' : color,
    });
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectRecipe(context),
      splashColor: color,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5,horizontal: 8),
        child: Card(
          elevation: 20,
          shadowColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          child: Column(
            children:[ Stack(
              children: [
                 ClipRRect(
                   borderRadius: BorderRadius.only(
                       topLeft: Radius.circular(18),
                       topRight: Radius.circular(18)
                   ),
                   child: Image.network(ImageUrl,
                     height: 280,
                     width: double.infinity,
                     fit: BoxFit.cover,
                   ),
                 ),
                Positioned(
                  top: 20,
                    left: 0,
                    child: Container(
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.black38,
                        borderRadius: BorderRadius.only(
                            //topRight: Radius.circular(5),
                            bottomRight: Radius.circular(50))
                      ),
                      padding: EdgeInsets.symmetric(vertical: 4,horizontal: 7),
                      child: Text(title,
                      style: TextStyle(
                        //backgroundColor: Colors.black.withOpacity(0.1),
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),

                        softWrap: true,
                        //overflow: TextOverflow.fade,

                      ),
                    ))
              ],
            ),
              Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.timer_sharp,color: color.withOpacity(0.8),),
                        SizedBox(width: 5,),
                        Text('$duration min'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work,color: color.withOpacity(0.8),),
                        SizedBox(width: 5,),
                        Text(ComplexityText),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.attach_money,color: color.withOpacity(0.8),),
                        SizedBox(width: 5,),
                        Text(AffordabilityText),
                      ],
                    ),
                  ],
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}

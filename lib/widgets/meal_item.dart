import '../widgets/meal_detail.dart';

import '../models/meals.dart';
import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Affordability affordability;
  final Complexity complexity;

  MealItem(
      {@required this.affordability,
      @required this.complexity,
      @required this.duration,
      @required this.imageUrl,
      @required this.title,
      @required this.id});
  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "Unknown";
    }
  }

  String get affordableText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      default:
        return "Unknown";
    }
  }

  void selectPage(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetail.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectPage(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(19)),
                    width: 300,
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'RobotoCondensed',
                          color: Colors.white70),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  ),
                )
              ],
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.access_time),
                        SizedBox(
                          width: 6,
                        ),
                        Text('$duration min')
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.view_compact),
                        SizedBox(
                          width: 6,
                        ),
                        Text(complexityText)
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.attach_money),
                        SizedBox(
                          width: 6,
                        ),
                        Text(affordableText)
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

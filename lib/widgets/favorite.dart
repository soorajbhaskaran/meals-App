import 'package:flutter/material.dart';
import '../models/meals.dart';
import './meal_item.dart';
class Favorite extends StatelessWidget {
  final List<Meal> _favoriteMeal;
  Favorite(this._favoriteMeal);
  @override
  Widget build(BuildContext context) {
    if (_favoriteMeal.isEmpty){
      return Center(child: Text("You dont have a favorite now- Please go and Add"),);
    }
    else{
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            affordability: _favoriteMeal[index].affordability,
            complexity: _favoriteMeal[index].complexity,
            duration: _favoriteMeal[index].duration,
            imageUrl: _favoriteMeal[index].imageUrl,
            title: _favoriteMeal[index].title,
            id: _favoriteMeal[index].id,
           
          );
        },
        itemCount: _favoriteMeal.length,
      );
    }
  }
}

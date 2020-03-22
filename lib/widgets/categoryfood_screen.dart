import '../widgets/meal_item.dart';
import '../models/meals.dart';

//import '../models/meals.dart';
import 'package:flutter/material.dart';

class CategoryFoodItem extends StatefulWidget {
  static const routeMeal = '/category-meal';
  final List<Meal> activeMeals;
  CategoryFoodItem(this.activeMeals);
  @override
  _CategoryFoodItemState createState() => _CategoryFoodItemState();
}

class _CategoryFoodItemState extends State<CategoryFoodItem> {
  String categoryTitle;
  List<Meal> displayedMeal;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final id = routeArg["id"];
    categoryTitle = routeArg["title"];
    displayedMeal = widget.activeMeals.where((meal) {
      return meal.categories.contains(id);
    }).toList();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    /*void _removeNow(String id) {
      setState(() {
        displayedMeal.removeWhere((meal) => meal.id == id);
      });
    }*/

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            affordability: displayedMeal[index].affordability,
            complexity: displayedMeal[index].complexity,
            duration: displayedMeal[index].duration,
            imageUrl: displayedMeal[index].imageUrl,
            title: displayedMeal[index].title,
            id: displayedMeal[index].id,
          );
        },
        itemCount: displayedMeal.length,
      ),
    );
  }
}

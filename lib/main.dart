import 'package:Meals/models/dummy_data.dart';
import 'package:Meals/models/meals.dart';
import 'package:Meals/widgets/filter.dart';
import 'package:Meals/widgets/tab_bar.dart';

import './widgets/meal_detail.dart';

import './widgets/category_screen.dart';
import './widgets/categoryfood_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "vegan": false,
    "vegetarian": false,
    "lactose": false,
  };
  List<Meal> _activeMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals=[];

  void _selectFilter(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _activeMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        return true;
      });
    });
  }

  void _selectFavorite(String id) {
    final _existingid = _favoriteMeals.indexWhere((meal) => meal.id == id);
    if (_existingid >= 0) {
      setState(() {
        return _favoriteMeals.removeWhere((meal) => meal.id == id);
      });
    } else {
      setState(() {
        return _favoriteMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == id));
      });
    }
  }

  bool _isSelected(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(254, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              caption: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold))),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(_favoriteMeals),
        CategoryFoodItem.routeMeal: (context) => CategoryFoodItem(_activeMeals),
        MealDetail.routeName: (context) =>
            MealDetail(_selectFavorite, _isSelected),
        FilterItems.filterRoute: (context) =>
            FilterItems(_filters, _selectFilter)
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
    );
  }
}

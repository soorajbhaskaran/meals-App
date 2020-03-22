import '../widgets/category_screen.dart';
import '../widgets/favorite.dart';
import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import '../models/meals.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> _favoriteMeal;
  TabsScreen(this._favoriteMeal);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;
  List<Widget> _page;
  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _page = [CategoriesScreen(), Favorite(widget._favoriteMeal)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MealsNow'),
      ),
      drawer: MainDrawer(),
      body: _page[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.white60,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.black87,
        elevation: 2,
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text("Categories")),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), title: Text("Favorite"))
        ],
      ),
    );
  }
}

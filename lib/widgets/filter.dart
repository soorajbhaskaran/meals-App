import 'package:Meals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterItems extends StatefulWidget {
  static const filterRoute = "/filter-route";
  final Function filterItems;
  final Map<String, bool> currentFilter;
  FilterItems(this.currentFilter, this.filterItems);
  @override
  _FilterItemsState createState() => _FilterItemsState();
}

class _FilterItemsState extends State<FilterItems> {
  var isGlutenFree = false;

  var isVegan = false;

  var isVeggie = false;

  var isLactoseFree = false;
  @override
  void initState() {
    isGlutenFree = widget.currentFilter['gluten'];
    isLactoseFree = widget.currentFilter['lactose'];
    isVegan = widget.currentFilter['vegan'];
    isVeggie = widget.currentFilter['vegetarian'];
    super.initState();
  }

  Widget buildSwitchView(
      String title, String subtitle, bool argument, Function _pressedOn) {
    return SwitchListTile(
      value: argument,
      onChanged: _pressedOn,
      title: Text(
        title,
        style: TextStyle(
            fontFamily: "Raleway",
            fontWeight: FontWeight.bold,
            color: Colors.black),
      ),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yours Favorite"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final _selectedItems = {
                  "gluten": isGlutenFree,
                  "vegan": isVegan,
                  "vegetarian": isVeggie,
                  "lactose": isLactoseFree,
                };
                widget.filterItems(_selectedItems);
              }),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(18),
            alignment: Alignment.topCenter,
            child: Text(
              "Adjust your Meals here ",
              style: Theme.of(context).textTheme.caption,
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              buildSwitchView(
                  "Gluten-Free", "Only include Gluten-Free Meals", isGlutenFree,
                  (value) {
                setState(() {
                  isGlutenFree = value;
                });
              }),
              buildSwitchView("Lactose-Free", "Only include Lactose-Free Meals",
                  isLactoseFree, (value) {
                setState(() {
                  isLactoseFree = value;
                });
              }),
              buildSwitchView(
                  "Vegetarian", "Only include Vegetarian Meals", isVeggie,
                  (value) {
                setState(() {
                  isVeggie = value;
                });
              }),
              buildSwitchView("Vegan", "Only include Vegan Meals", isVegan,
                  (value) {
                setState(() {
                  isVegan = value;
                });
              })
            ],
          ))
        ],
      ),
    );
  }
}

import '../widgets/filter.dart';
import '../widgets/tab_bar.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildDrawer(
      String title, Icon icon, String subtitle, Function selectController) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
      ),
      subtitle: Text(subtitle),
      onTap: selectController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: 120,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontFamily: "RobotoCondensed",
                  color: Theme.of(context).primaryColor,
                  fontSize: 40),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildDrawer("Meals", Icon(Icons.restaurant), "Good Meals", () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          Divider(
            color: Colors.black12,
          ),
          buildDrawer("Settings", Icon(Icons.settings), "Get into", () {
            Navigator.of(context).pushReplacementNamed(FilterItems.filterRoute);
          })
        ],
      ),
    );
  }
}

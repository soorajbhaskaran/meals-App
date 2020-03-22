import '../models/dummy_data.dart';
import 'package:flutter/material.dart';

class MealDetail extends StatelessWidget {
  static const routeName = "/meals-detail";
  final Function _selectFavorite;
  final Function _isSelected;
  MealDetail(this._selectFavorite, this._isSelected);

  Widget buildContainerText(BuildContext context, String text) {
    return Container(
      child: Text(text, style: Theme.of(context).textTheme.caption),
      margin: EdgeInsets.symmetric(vertical: 7),
    );
  }

  Widget buildListText(Widget child) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        padding: EdgeInsets.all(6),
        height: 130,
        width: 250,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final argRouteId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((meal) => meal.id == argRouteId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildContainerText(context, "Ingredients"),
            buildListText(
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Text(selectedMeal.ingredients[index])),
                    color: Theme.of(context).accentColor,
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildContainerText(context, "Steps"),
            buildListText(ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('#${index + 1}'),
                      ),
                      title: Text(selectedMeal.ingredients[index]),
                    ),
                    Divider(color: Colors.grey)
                  ],
                );
              },
              itemCount: selectedMeal.ingredients.length,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>_selectFavorite(argRouteId),
        child: Icon(_isSelected(argRouteId) ? Icons.star : Icons.star_border),
      ),
    );
  }
}

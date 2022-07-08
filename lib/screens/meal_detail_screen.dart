import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget builSectionIngredientTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget buildSectionIngredient(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 130,
      width: 300,
      child: child,
    );
  }

  Widget buildSectionSteps(Widget child) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      width: 300,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black87),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealDetailID = ModalRoute.of(context)?.settings.arguments as String;

    final selectedMeal = DUMMY_MEALS.firstWhere((meal) {
      return meal.id.contains(mealDetailID);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            builSectionIngredientTitle(context, "Ingredient"),
            buildSectionIngredient(
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Card(
                      color: Theme.of(context).accentColor,
                      child: Text(selectedMeal.ingredients[index]));
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            buildSectionSteps(
              ListView.builder(
                  itemBuilder: (ctx, index) => Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              child: Text('# ${index + 1}'),
                            ),
                            title: Text(selectedMeal.steps[index]),
                          ),
                          Divider(),
                        ],
                      ),
                  itemCount: selectedMeal.steps.length),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 45,
        width: 45,
        child: FloatingActionButton(
          child: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.of(context).pop(mealDetailID);
          },
        ),
      ),
    );
  }
}

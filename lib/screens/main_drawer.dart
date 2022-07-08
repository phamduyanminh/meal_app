import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, Icon icon, Function tapHandler) {
    return ListTile(
      onTap: () => tapHandler(),
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          child: Text("Coooking up"),
        ),
        const SizedBox(
          height: 20,
        ),
        buildListTile(
          "Meals",
          Icon(Icons.restaurant),
          () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        buildListTile(
          "Filters",
          Icon(Icons.settings),
          () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          },
        ),
      ],
    );
  }
}

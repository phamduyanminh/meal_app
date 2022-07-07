import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, Icon icon, Function tapHandler) {
    return ListTile(
      onTap: null,
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
            Navigator.of(context).pushNamed('/');
          },
        ),
        buildListTile(
          "Filters",
          Icon(Icons.settings),
          () {},
        ),
      ],
    );
  }
}

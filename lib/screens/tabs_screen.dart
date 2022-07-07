import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favorites_screen.dart';
import './main_drawer.dart';

class TabScreen extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TabScreen> {
  final List<Map<dynamic, dynamic>> _pages = [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': FavoritesScreen(),
      'title': 'Your Favorites',
    },
  ];

  int _selectedIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Create a top navigation bar
    //   return DefaultTabController(
    //     length: 2,
    //     initialIndex: 0, //First tab always shows up first
    //     child: Scaffold(
    //       appBar: AppBar(
    //         title: Text('Meal App'),
    //         bottom: TabBar(
    //           tabs: [
    //             Tab(icon: Icon(Icons.category), text: "Categories"),
    //             Tab(icon: Icon(Icons.star), text: "Favorites"),
    //           ],
    //         ),
    //       ),
    //       body: TabBarView(children: [
    //         CategoriesScreen(),
    //         FavoritesScreen(),
    //       ]),
    //     ),
    //   );
    // }

    //Create bottom navigation bar
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]['title']),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => _selectPage(index),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink[400],
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}

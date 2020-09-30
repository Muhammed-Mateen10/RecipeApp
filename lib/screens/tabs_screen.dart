import 'package:Food_app/models/meal.dart';
import 'package:Food_app/widgets/drawer.dart';

import './Homepage.dart';
import 'package:flutter/material.dart';
import './favoritesScreen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouritemeals;
  TabsScreen(this.favouritemeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int selectedpageindex = 0;
  void _selectpage(int index) {
    setState(() {
      selectedpageindex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {
        'page': HomePage(),
        'title': 'Categories',
      },
      {
        'page': FavouritesScreen(widget.favouritemeals),
        'title': 'Favourites',
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[selectedpageindex]['title']),
      ),
      drawer: MyDrawer(),
      body: _pages[selectedpageindex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        currentIndex: selectedpageindex,
        selectedItemColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.yellow,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.yellow,
            icon: Icon(Icons.favorite),
            title: Text('Favorites'),
          ),
        ],
        onTap: _selectpage,
      ),
    );
  }
}

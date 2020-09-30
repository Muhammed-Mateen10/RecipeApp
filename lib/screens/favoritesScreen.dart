import 'package:Food_app/models/meal.dart';
import 'package:flutter/material.dart';

class FavouritesScreen extends StatelessWidget {
  List<Meal> favouritemeals;
  FavouritesScreen(this.favouritemeals);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'To be added soon',
      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
    ));
  }
}

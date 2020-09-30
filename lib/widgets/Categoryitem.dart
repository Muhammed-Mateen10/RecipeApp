import 'package:Food_app/screens/Categories_selected.dart';
import 'package:flutter/material.dart';

class CatergoryItem extends StatelessWidget {
  final String title;
  final String id;
  final Color color;
  CatergoryItem({this.id, this.title, this.color});
  void selectCategoryscreen(BuildContext context) {
    Navigator.of(context).pushNamed(CategoriesSelected.route,
        arguments: {'id': id, 'title': title, 'color': color});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategoryscreen(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        // color: color,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}

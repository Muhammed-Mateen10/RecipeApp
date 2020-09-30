import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/Categoryitem.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(20),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        ...data
            .map((data) => CatergoryItem(
                id: data.id, title: data.title, color: data.color))
            .toList(),
      ],
    );
  }
}

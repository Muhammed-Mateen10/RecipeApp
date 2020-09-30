import 'package:Food_app/models/meal.dart';
import 'package:Food_app/widgets/mealitem.dart';
import 'package:flutter/material.dart';

class CategoriesSelected extends StatefulWidget {
  // final String id;
  // final String title;
  // final Color catergorycolor;
  // CategoriesSelected(this.id, this.title, this.catergorycolor);
  static const route = 'CategoriesSelected';
  final List<Meal> available;
  CategoriesSelected(this.available);
  @override
  _CategoriesSelectedState createState() => _CategoriesSelectedState();
}

class _CategoriesSelectedState extends State<CategoriesSelected> {
  String categorytitle;
  List<Meal> displayedmeals;
  Color color;
  bool firsttime = false;
  @override
  @override
  void didChangeDependencies() {
    if (!firsttime) {
      final routeArguments =
          ModalRoute.of(context).settings.arguments as Map<String, Object>;
      categorytitle = routeArguments['title'];
      color = routeArguments['color'];
      final id = routeArguments['id'];
      displayedmeals = widget.available
          .where((element) => element.categories.contains(id))
          .toList();
      firsttime = true;
    }
    super.didChangeDependencies();
  }

  void removeMeal(String mealId) {
    setState(() {
      displayedmeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(
          categorytitle,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) => MealItem(
          id: displayedmeals[index].id,
          affordability: displayedmeals[index].affordability,
          title: displayedmeals[index].title,
          imageurl: displayedmeals[index].imageUrl,
          complexity: displayedmeals[index].complexity,
          duration: displayedmeals[index].duration,
          removeItem: removeMeal,
        ),
        itemCount: displayedmeals.length,
      ),
    );
  }
}

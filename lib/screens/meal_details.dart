import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealScreen extends StatelessWidget {
  static const routeName = '/MealScreen';
  Widget buildtitle(String text, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      width: 300,
      height: 150,
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(8.0),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    final selectedRecipe = mealdata.firstWhere(
      (meal) => meal.id == id,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedRecipe.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedRecipe.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildtitle('Ingredients', context),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    child: Text(
                      selectedRecipe.ingredients[index],
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                itemCount: selectedRecipe.ingredients.length,
              ),
            ),
            buildtitle('Steps', context),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 25.0,
                      child: Text(
                        '#${index + 1}',
                      ),
                    ),
                    title: Text(
                      selectedRecipe.steps[index],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                itemCount: selectedRecipe.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(id);
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}

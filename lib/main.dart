import 'package:Food_app/models/meal.dart';
import 'package:Food_app/screens/Settings.dart';
import 'package:Food_app/screens/meal_details.dart';
import 'package:Food_app/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'dummy_data.dart';
import 'screens/Categories_selected.dart';
import 'screens/Homepage.dart';

void main() => runApp(FoodApp());

class FoodApp extends StatefulWidget {
  @override
  _FoodAppState createState() => _FoodAppState();
}

class _FoodAppState extends State<FoodApp> {
  Map<String, bool> settingsdata = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Meal> availablemeals = mealdata;
  List<Meal> favouritemeals = [];
  void _setsettings(Map<String, bool> changeddata) {
    setState(() {
      settingsdata = changeddata;

      availablemeals = mealdata.where((element) {
        if (settingsdata['gluten'] && !element.isGlutenFree) {
          return false;
        }
        if (settingsdata['lactose'] && !element.isLactoseFree) {
          return false;
        }
        if (settingsdata['vegan'] && !element.isVegan) {
          return false;
        }
        if (settingsdata['vegetarian'] && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _setfavourites(String mealId) {
    final index = favouritemeals.indexWhere((element) => element.id == mealId);
    if (index >= 0) {
      setState(() {
        favouritemeals.removeAt(index);
      });
    } else
      setState(() {
        favouritemeals
            .add(mealdata.firstWhere((element) => element.id == mealId));
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Food App",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 249, 1),
        fontFamily: 'Raleway',
        textTheme: Theme.of(context).textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      initialRoute: '/', // '/' Defeault
      routes: {
        '/': (ctx) => TabsScreen(favouritemeals),
        CategoriesSelected.route: (ctx) => CategoriesSelected(availablemeals),
        MealScreen.routeName: (ctx) => MealScreen(),
        Settings.routeName: (ctx) => Settings(settingsdata, _setsettings),
      },
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (ctx) => HomePage()),
    );
  }
}

import 'package:Food_app/models/meal.dart';
import 'package:Food_app/screens/meal_details.dart';
import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;
  final String imageurl;
  final Function removeItem;
  MealItem(
      {@required this.id,
      @required this.title,
      @required this.imageurl,
      @required this.affordability,
      @required this.complexity,
      @required this.duration,
      @required this.removeItem});
  void mealdetails(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealScreen.routeName, arguments: id)
        .then((value) => removeItem(value));
  }

  String get comp {
    if (complexity == Complexity.Simple) {
      return 'Simple';
    } else if (complexity == Complexity.Hard) {
      return 'Hard';
    } else if (complexity == Complexity.Challenging) {
      return 'Challenging';
    }
  }

  String get Aff {
    if (affordability == Affordability.Affordable) {
      return 'Affordable';
    } else if (affordability == Affordability.Luxurious) {
      return 'Expensive';
    } else if (affordability == Affordability.Pricey) {
      return 'Pricey';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => mealdetails(context),
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10)),
                  child: Image.network(
                    imageurl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    color: Colors.black54,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                    width: 300,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.fade,
                      softWrap: true,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Icon(Icons.timer),
                      SizedBox(height: 5),
                      Text(
                        '$duration min',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.whatshot),
                      SizedBox(height: 5),
                      Text(
                        '$comp',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(height: 5),
                      Text(
                        '$Aff',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:recyclear/screens/screen_bar.dart';
import 'add_food/add_food.dart';
import 'list_builder.dart';

class Food extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenBar(context, "List of food"),
      body: ListBuilder("food"),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _navToAddFood(context),
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrangeAccent,
      ),
    );
  }

  void _navToAddFood(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AddFood()
        )
    );
  }
}
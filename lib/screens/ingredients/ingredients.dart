import 'package:flutter/material.dart';
import 'package:recyclear/screens/screen_bar.dart';
import 'add_ingredient/add_ingredient.dart';
import '../foods/list_builder.dart';

class Ingredients extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenBar(context, "List of ingredients"),
      body: ListBuilder("ingredient"),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navToAddIngredient(context),
        child: Icon(Icons.add),
        backgroundColor: Colors.lightGreen,
      ),
    );
  }

  void _navToAddIngredient(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AddIngredient()
        )
    );
  }
}
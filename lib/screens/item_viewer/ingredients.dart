import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:recyclear/screens/item_add/add_item.dart';
import 'package:recyclear/screens/screen_bar.dart';
import 'list_builder.dart';

class Ingredients extends StatelessWidget {
  FirebaseUser user;

  Ingredients(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenBar(context, "List of ingredients"),
      body: ListBuilder(user, "ingredient"),
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
            builder: (context) => AddItem("ingredient")
        )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:recyclear/screens/screen_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../item_add/add_item.dart';
import 'list_builder.dart';

class Food extends StatelessWidget{
  FirebaseUser user;

  Food(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenBar(context, "List of food"),
      body: ListBuilder(user, "food"),
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
            builder: (context) => AddItem("food")
        )
    );
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recyclear/screens/home/home_bar.dart';
import './nav_button.dart';

class Home extends StatelessWidget {
  FirebaseUser user;

  Home(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeBar(context, user),
      body: Column(
        children: <Widget>[
          NavButton("Food"),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: Text(
            "Food",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          NavButton("Ingredients"),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: Text(
              "Ingredients",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
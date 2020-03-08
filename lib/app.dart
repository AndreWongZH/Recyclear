import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'screens/home/home.dart';

class App extends StatefulWidget {
  FirebaseUser user;

  App(this.user);

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(widget.user),
    );
  }
}

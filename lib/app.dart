import 'package:flutter/material.dart';
import 'screens/home/home.dart';

class App extends StatefulWidget {
 @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Home(),
    );
  }
}
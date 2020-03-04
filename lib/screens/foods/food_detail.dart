import 'package:flutter/material.dart';
import 'package:recyclear/screens/screen_bar.dart';

class FoodDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenBar(context, "details page"),
      body: Text("details page"),
    );
  }
}
import 'package:flutter/material.dart';

Widget ScreenBar(context, title){
  Decoration _barDecoration = BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: <Color>[
          Colors.indigo[300],
          Colors.teal[300]
        ],
      )
  );

  TextStyle _appBarTitleStyle = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 19
  );

  return AppBar(
      flexibleSpace: Container(
        decoration: _barDecoration,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
      title: Text(
        title,
        style: _appBarTitleStyle,
      ),
  );
}
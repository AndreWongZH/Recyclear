import 'package:flutter/material.dart';
import '../../auth/auth.dart';
import '../login/login.dart';
import 'info_bar.dart';

Widget HomeBar(context){

  BoxDecoration _homebarDecoration = BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: <Color>[
          Colors.indigo[300],
          Colors.teal[300]
        ],
      )
  );

  void _signOut() {
    signOutGoogle();
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return Login();}), ModalRoute.withName('/'));
  }

  return AppBar(
      flexibleSpace: Container(
        decoration: _homebarDecoration,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
      title: Text(
        'Recyclear',
        style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 19
        ),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () => _signOut(),
          child: Text(
              "Sign Out",
              style: TextStyle(
                color: Colors.white
              ),
          ),
        ),
      ],
    bottom: PreferredSize(
        child: InfoBar(),
        preferredSize: Size.fromHeight(50.0)
    )
  );
}
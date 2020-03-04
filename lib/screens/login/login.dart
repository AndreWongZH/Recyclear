import 'package:flutter/material.dart';
import 'sign_in_button.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  BoxDecoration _backgroundGradient = BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            Colors.teal[300],
            Colors.indigo[300],
          ]
      )
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: _backgroundGradient,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/logo.png",
                ),
                SizedBox(height: 50),
                SignInButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
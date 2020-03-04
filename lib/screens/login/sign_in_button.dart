import 'package:flutter/material.dart';
import 'package:recyclear/auth/auth.dart';
import 'package:recyclear/app.dart';

class SignInButton extends StatelessWidget {
  void _signIn(context) {
    signInWithGoogle().whenComplete(() {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => App()
      ));
    });
  }

  TextStyle _googleButton = TextStyle(
    fontSize: 20,
    color: Colors.grey,
  );

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.white,
      splashColor: Colors.grey,
      onPressed: () => _signIn(context),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40)
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: _googleButton,
              ),
            )
          ],
        ),
      ),
    );
  }
}
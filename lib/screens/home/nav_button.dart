import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../item_viewer/food.dart';
import '../item_viewer/ingredients.dart';

class NavButton extends StatelessWidget {
  FirebaseUser user;
  String _location;

  NavButton(this.user, this._location);

  void _redirect(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => _pageFinder()));
  }

  String _getImagePath() {
    if (this._location == "Food") {
      return "assets/macroon.jpg";
    }
    return "assets/ingredients.jpg";
  }

  Widget _pageFinder() {
    if (this._location == "Food") {
      return Food(user);
    }
    return Ingredients(user);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.all(0.0),
        onPressed: () => _redirect(context),
        child: Container(
          padding: EdgeInsets.all(0.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                _getImagePath(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

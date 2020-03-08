import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth.dart';

Widget BottomNavBar(context, _type, _id, _uid) {
  void deleteDocument() {
    try {
      Firestore.instance.collection(_type).document(_id).delete();
      Navigator.pop(context);
    } catch (e) {
      print(e.toString());
    }
  }

  return BottomAppBar(
    child: Container(
      height: 60.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: <Color>[Colors.indigo[300], Colors.teal[300]],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton(
              onPressed: () => {Navigator.pop(context)},
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Opacity(
                child: _uid == uid
                    ? RaisedButton(
                        color: Colors.redAccent[100],
                        onPressed: () => deleteDocument(),
                        child: Text("Delete"),
                      )
                    : RaisedButton(
                        color: Colors.greenAccent[200],
                        onPressed: () => {},
                        child: Text("Get " + _type),
                      ),
                opacity: 0.9),
          ),
        ],
      ),
    ),
  );
}

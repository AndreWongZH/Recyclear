import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRow extends StatelessWidget {
  String _uid;

  UserRow(this._uid);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream:
            Firestore.instance.collection("users").document(_uid).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('no data :(');
          } else {
            DocumentSnapshot user = snapshot.data;

            return Container(
              padding: EdgeInsets.only(left: 20.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Listed by: ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(user["photoUrl"]),
                    radius: 20,
                    backgroundColor: Colors.transparent,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      user["name"],
                    ),
                  )
                ],
              ),
            );
          }
        });
  }
}

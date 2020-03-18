import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InfoBar extends StatelessWidget {
  FirebaseUser user;

  InfoBar(this.user);

  @override
  Widget build(BuildContext context) {
    TextStyle _infoBarStyle = TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    );

    return Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: StreamBuilder(
            stream: Firestore.instance
                .collection("users")
                .document(user.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                DocumentSnapshot user = snapshot.data;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: user['photoUrl'] == null
                              ? AssetImage("assets/human.png")
                              : NetworkImage(
                            user['photoUrl'],
                                ),
                          radius: 20,
                          backgroundColor: Colors.transparent,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            user['name'] == null ? "" : user['name'],
                            style: _infoBarStyle,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Tokens: ' + user['token'].toString(),
                      style: _infoBarStyle,
                    ),
                  ],
                );
              }
            }));
  }
}

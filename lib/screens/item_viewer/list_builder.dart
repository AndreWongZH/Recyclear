import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../item_detail/item_detail.dart';

class ListBuilder extends StatelessWidget {
  String type;
  FirebaseUser user;

  ListBuilder(this.user, this.type);

  List<Widget> widgetList(ds) {
    if (type == "food") {
      return [
        Text(
          ds["name"],
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        Text(ds["location"]),
        Text(ds["time"]),
      ];
    }
    return [
      Text(
        ds["name"],
        style: TextStyle(
          fontSize: 25,
        ),
      ),
      Text(ds["expiry"]),
      Text(ds["location"]),
      Text(ds["time"]),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Firestore.instance.collection(type).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            List<DocumentSnapshot> items = snapshot.data.documents;

            return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = items[index];
                  return FlatButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ItemDetail(
                                user, type, ds.documentID, ds["uid"]))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 40.0),
                          child: Row(
                            children: <Widget>[
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(30.0),
                                  child: CachedNetworkImage(
                                    imageUrl: ds["image"],
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    width: 100,
                                    height: 100,
                                  )),
                              SizedBox(
                                width: 20.0,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: widgetList(ds),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                });
          }
        });
  }
}

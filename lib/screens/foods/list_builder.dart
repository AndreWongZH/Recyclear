import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../item_detail/item_detail.dart';

class ListBuilder extends StatelessWidget {
  String type;

  ListBuilder(this.type);

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
            return Text('no data :(');
          } else {
            List<DocumentSnapshot> items = snapshot.data.documents;

            return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = items[index];
                  return FlatButton(
                    onPressed: () => Navigator.push(
                        context, MaterialPageRoute(
                          builder: (context) => ItemDetail("food", ds.documentID, ds["uid"])
                        )
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 40.0),
                            child: Row(
                              children: <Widget>[
                                ds["image"] != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(30.0),
                                      child: Image.network(
                                          ds["image"],
                                          width: 100,
                                          height: 100,
                                        ),
                                    )
                                  : Icon(
                                      Icons.fastfood,
                                      size: 50,
                                    ),
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
                }
            );
          }
        }
    );
  }
}
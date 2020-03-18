import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recyclear/screens/item_detail/user_row.dart';

class MainWidget extends StatelessWidget {
  String _type;
  var item;

  MainWidget(this._type, this.item);

  Widget infoWidget(item) {
    if (_type == "food") {
      return Container(
        padding: EdgeInsets.only(left: 20.0),
        child: Row(
          children: <Widget>[
            Icon(Icons.monetization_on),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(item["token"].toString()),
            ),
          ],
        ),
      );
    }
    return Container(
      padding: EdgeInsets.only(left: 20.0),
      child: Row(
        children: <Widget>[
          Icon(Icons.timer),
          Container(
            padding: EdgeInsets.only(left: 10.0),
            child: Text("Expired by " + item["expiry"]),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        item != null ? Container(
            height: 500,
            color: Colors.grey[400],
            child: ClipRRect(
              child: CachedNetworkImage(
                imageUrl: item["image"],
                width: 200,
                placeholder: (context, url) => CircularProgressIndicator(),
              ),
              borderRadius: BorderRadius.circular(40.0),
            ))
            : Container(),
        item != null ? Container(
          padding: EdgeInsets.fromLTRB(20.0, 0.0, 10.0, 10.0),
          child: Text(
            item["name"],
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ): Container(),
        item != null ? Container(
          padding: EdgeInsets.only(left: 20.0),
          child: Row(
            children: <Widget>[
              Icon(Icons.home),
              Container(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(item["location"]),
              ),
            ],
          ),
        ) : Container(),
        item != null ? Container(
          padding: EdgeInsets.only(left: 20.0),
          child: Row(
            children: <Widget>[
              Icon(Icons.access_time),
              Container(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(item["time"]),
              ),
            ],
          ),
        ) : Container(),
        item != null ? infoWidget(item) : Container(),
        item != null ? UserRow(item["uid"]) : Container(),
      ],
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recyclear/screens/item_detail/bottom_nav_bar.dart';
import 'package:recyclear/screens/item_detail/main_widget.dart';
import '../../auth/auth.dart';

class ItemDetail extends StatelessWidget {
  String _type;
  String _id;
  String _uid;

  ItemDetail(this._type, this._id, this._uid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: Firestore.instance.collection(_type).document(_id).snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text('no data :(');
            } else {
              DocumentSnapshot item = snapshot.data;
              return MainWidget(_type, item);
            }
          }
      ),
      bottomNavigationBar: BottomNavBar(context, _type, _id, _uid),
    );
  }
}
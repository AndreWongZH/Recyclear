import 'package:flutter/material.dart';
import '../../auth/auth.dart';

class InfoBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle _infoBarStyle = TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    );

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: imageUrl == null
                    ? AssetImage("assets/human.png")
                    : NetworkImage(
                  imageUrl,
                ),
                radius: 20,
                backgroundColor: Colors.transparent,
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  name == null ? "" : name,
                  style: _infoBarStyle,
                ),
              ),
            ],
          ),
          Text(
            'Tokens: ' + token.toString(),
            style: _infoBarStyle,
          ),
        ],
      ),
    );
  }
}
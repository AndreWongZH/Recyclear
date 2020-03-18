import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth.dart';

Widget BottomNavBar(context, _type, _id, _uid, user) {
  TextEditingController _codeController = TextEditingController();

  void showCode(context) async {
    DocumentSnapshot item =
        await Firestore.instance.collection(_type).document(_id).get();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Code is " + item["code"]),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("CLOSE")),
          ],
        );
      },
    );
  }

  void deleteDocument() {
    try {
      Firestore.instance.collection(_type).document(_id).delete();
      Navigator.pop(context);
    } catch (e) {
      print(e.toString());
    }
  }

  void addTokens(token) async {
    // update user's token and pop
    if (_type == 'food') {
      DocumentSnapshot userDoc =
      await Firestore.instance.collection("users").document(user.uid).get();

      int tokensToDeduct = userDoc["token"] - token;

      Firestore.instance.collection("users").document(user.uid).updateData({'token': tokensToDeduct});
    } else {
      DocumentSnapshot userDoc =
      await Firestore.instance.collection("users").document(_uid).get();

      int tokensToAdd = userDoc["token"] + 50;

      Firestore.instance.collection("users").document(_uid).updateData({'token': tokensToAdd});
    }

    Firestore.instance.collection(_type).document(_id).delete();
  }

  void showError() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Incorrct Code"),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("CLOSE")),
          ],
        );
      },
    );
  }

  void checkCode(item) async {
    if (item['code'] == _codeController.text) {
      addTokens(item["token"]);
      Navigator.of(context).popUntil((route) => route.isFirst);
    } else {
      showError();
    }
  }

  void enterCode(context) async {
    DocumentSnapshot item =
    await Firestore.instance.collection(_type).document(_id).get();
    DocumentSnapshot userDoc =
    await Firestore.instance.collection("users").document(user.uid).get();

    if (_type == "ingredient") {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Get code from client"),
              content: TextField(
                controller: _codeController,
                decoration:
                    InputDecoration(hintText: "Proceed by entering code"),
              ),
              actions: <Widget>[
                FlatButton(onPressed: () => checkCode(item), child: Text("CONFIRM")),
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("CANCEL"))
              ],
            );
          });
    }

    if (_type == "food" && item['token'] > userDoc['token']) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Not enough tokens required"),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("CLOSE")),
              ],
            );
          });
    }
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(item["token"].toString() + " tokens will be deducted."),
            content: TextField(
              controller: _codeController,
              decoration: InputDecoration(hintText: "Proceed by entering code"),
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => checkCode(item),
                  child: Text("CONFIRM")),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("CANCEL"))
            ],
          );
        });
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
          Row(
            children: <Widget>[
              _uid == uid
                  ? Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: RaisedButton(
                        color: Colors.blueGrey[200].withOpacity(0.5),
                        onPressed: () => showCode(context),
                        child: Text("Show Code"),
                      ),
                    )
                  : Container(),
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
                            onPressed: () => enterCode(context),
                            child: Text("Get " + _type),
                          ),
                    opacity: 0.9),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

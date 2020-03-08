import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:recyclear/screens/screen_bar.dart';
import '../../auth/auth.dart';
import 'form_submit.dart';

class AddItem extends StatefulWidget {
  String type;

  AddItem(this.type);

  @override
  AddItemState createState() => AddItemState();
}

class AddItemState extends State<AddItem> {
  final _formKey = GlobalKey<FormState>();
  final databaseReference = Firestore.instance;
  final storageReference = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenBar(context, widget.type == "food" ? "Add Food" : "Add Ingredient"),
      body: SingleChildScrollView(child: FormSubmit(widget.type, _formKey, _sendData),),
    );
  }

  void _sendData(context, name, location, time, image, additional) async {
    String _imageUrl;
    StorageReference imageRef =
        storageReference.ref().child("food/${path.basename(image.path)}");
    StorageUploadTask uploadTask = imageRef.putFile(image);
    await uploadTask.onComplete;
    _imageUrl = await imageRef.getDownloadURL();

    List code = List.generate(7, (index) => index);
    code.shuffle();

    if (widget.type == "food") {
      DocumentReference ref = await databaseReference.collection("food").add({
        'name': name,
        'location': location,
        'time': time,
        'image': _imageUrl,
        'uid': uid,
        'token': int.parse(additional),
        'code': code.join(),
      });
    } else {
      DocumentReference ref = await databaseReference.collection("ingredient")
          .add({
        'name': name,
        'expiry': additional,
        'location': location,
        'time': time,
        'image': _imageUrl,
        'uid': uid,
        'code': code.join(),
      });
    }

    final snackBar = SnackBar(
      content: Text('Food item added'),
      action: SnackBarAction(
          label: "return",
          onPressed: () {
            Navigator.pop(context);
          }),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}

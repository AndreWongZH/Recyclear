import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:recyclear/screens/screen_bar.dart';
import '../../../auth/auth.dart';
import 'form_submit.dart';

class AddIngredient extends StatefulWidget {
  @override
  AddIngredientState createState() => AddIngredientState();
}

class AddIngredientState extends State<AddIngredient> {
  final _formKey = GlobalKey<FormState>();
  final databaseReference = Firestore.instance;
  final storageReference = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenBar(context, "Add ingredients"),
      body: FormSubmit(_formKey, _sendData),
    );
  }

  void _sendData(context, name, expiry, location, time, image) async {
    String _imageUrl;
    StorageReference imageRef =  storageReference.ref().child("food/${path.basename(image.path)}");
    StorageUploadTask uploadTask = imageRef.putFile(image);
    await uploadTask.onComplete;
    _imageUrl = await imageRef.getDownloadURL();

    DocumentReference ref = await databaseReference.collection("ingredient")
        .add({
      'name': name,
      'expiry': expiry,
      'location': location,
      'time': time,
      'image': _imageUrl,
      'uid': uid,
    });
    final snackBar = SnackBar(
      content: Text('Ingredient item added'),
      action: SnackBarAction(
          label: "return",
          onPressed: () {
            Navigator.pop(context);
          }
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
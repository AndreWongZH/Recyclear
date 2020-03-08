import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'form_submit_component.dart';

class FormSubmit extends StatefulWidget {
  GlobalKey<FormState> _formKey;
  Function _sendData;

  FormSubmit(this._formKey, this._sendData);

  @override
  FormSubmitState createState() => FormSubmitState();
}

class FormSubmitState extends State<FormSubmit> {
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final _timeController = TextEditingController();
  final _tokenController = TextEditingController();

  File _image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Form(
          key: widget._formKey,
          child: Column(
            children: <Widget>[
              FormSubmitComponent("Enter name of food to give away", "Please enter a food name", _nameController),
              FormSubmitComponent("Enter where you live", "Please enter a location", _locationController),
              FormSubmitComponent("Enter availability of time", "Please enter a time period", _timeController),
              FormSubmitComponent("Enter tokens", "Please enter a value", _tokenController),
              _image != null
                ? Image.asset(
                  _image.path,
                  height: 150,
                  )
                : Container(height: 150,),
              _image == null
                  ? FlatButton(
                      onPressed: () => _chooseFile(),
                      child: Text("Add photo")
                    )
                  : Container(height: 100,),
              RaisedButton(
                onPressed: () {
                  if (widget._formKey.currentState.validate()) {
                    widget._sendData(context, _nameController.text, _locationController.text, _timeController.text, _image, _tokenController.text);
                  }
                },
                child: Text("Submit"),
              ),
            ],
          )
      ),
    );
  }
  
  Future _chooseFile() async {
    await ImagePicker.pickImage(source: ImageSource.gallery)
        .then((image) {
          setState(() {
            _image = image;
          });
        });
  }
}
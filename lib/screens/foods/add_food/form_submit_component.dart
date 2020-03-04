import 'package:flutter/material.dart';

class FormSubmitComponent extends StatelessWidget {
  String _hintText;
  String _errorText;
  TextEditingController _controller;

  FormSubmitComponent(this._hintText, this._errorText, this._controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: _hintText,
        ),
        validator: (value) {
          if (value.isEmpty) {
            return _errorText;
          }
          return null;
        },
      ),
    );
  }
}
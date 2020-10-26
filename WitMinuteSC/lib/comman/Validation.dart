import 'package:flutter/material.dart';

class Validation{

  static Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static bool isRequired(value){
    if (value.length == 0) {
      return false;
    }else{
      return true;
    }
  }
  static bool isValidEmail(value){
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return false;
    else
      return true;
  }

  static SnakbarMessage(BuildContext context,String message){
    final snackBar = SnackBar(content: Text(message));

// Find the Scaffold in the widget tree and use it to show a SnackBar.
    Scaffold.of(context).showSnackBar(snackBar);
  }


}

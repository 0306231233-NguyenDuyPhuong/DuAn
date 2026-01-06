
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySnackbar{
   bool checkInput(TextEditingController txtController, BuildContext context, String title){
    if(txtController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("$title không được để trống"))
      );
      return false;
    }
    return true;
  }

  void showSnackbar(BuildContext context, String title){
     ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("$title"))
    );
  }
}
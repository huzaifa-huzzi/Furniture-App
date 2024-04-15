import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {

  static focusFtn(BuildContext context,FocusNode current , FocusNode next){
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.red,
       textColor:  Colors.white,
      gravity: ToastGravity.BOTTOM,
    );

  }



}
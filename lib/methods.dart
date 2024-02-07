import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Methods {
  static navigateTo(BuildContext context, Widget whichClass) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => whichClass));
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.teal,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM);
  }
}

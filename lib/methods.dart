import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_diary_play_store_release/add_note_page.dart';
import 'package:my_diary_play_store_release/model_add_note.dart';
import 'package:share_plus/share_plus.dart';

import 'database_helper.dart';
import 'home_page.dart';
import 'main.dart';

class Methods {
  static navigateTo(BuildContext context, Widget whichClass) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => whichClass));
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_diary_play_store_release/database_helper.dart';
import 'package:my_diary_play_store_release/home_page.dart';
import 'package:my_diary_play_store_release/main.dart';
import 'package:my_diary_play_store_release/methods.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  static TextEditingController controllerTitle = TextEditingController();
  static TextEditingController controllerDescription = TextEditingController();
  final _formField = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.teal),
        title: Text(
          'Add Note',
          style: TextStyle(color: Colors.teal),
        ),
        actions: [
          IconButton(
              onPressed: () {
                print('----------> done button clicked');
                onSave();
              },
              icon: Icon(Icons.done))
        ],
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formField,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 25.0, horizontal: 25),
                  child: TextFormField(
                    controller: controllerTitle,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                        hintText: 'Enter Your Title',
                        hintStyle: TextStyle(
                          fontSize: 15,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    maxLines: 1,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Title';
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextFormField(
                  controller: controllerDescription,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                      hintText: 'Start Writing here ....',
                      hintStyle: TextStyle(
                        fontSize: 15,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  maxLines: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onSave() async {
    Map<String, dynamic> row = {
      DataBaseHelper.columnTitle: controllerTitle.text,
      DataBaseHelper.columnDescription: controllerDescription.text
    };
    final result = await dbhelper.insertDiaryDetails(row);
    print('-------->$result');
    Fluttertoast.showToast(
        msg: 'Saved Successfully',
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.teal,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM);
    Methods.navigateTo(context, HomePage());
    controllerTitle.clear();
    controllerDescription.clear();
  }
}

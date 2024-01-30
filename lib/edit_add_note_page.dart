import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_diary_play_store_release/database_helper.dart';
import 'package:my_diary_play_store_release/home_page.dart';
import 'package:my_diary_play_store_release/main.dart';
import 'package:my_diary_play_store_release/methods.dart';
import 'package:my_diary_play_store_release/model_add_note.dart';

class EditAddNotePage extends StatefulWidget {
  const EditAddNotePage({super.key});

  @override
  State<EditAddNotePage> createState() => _EditAddNotePageState();
}

class _EditAddNotePageState extends State<EditAddNotePage> {
  static TextEditingController controllerTitle = TextEditingController();
  static TextEditingController controllerDescription = TextEditingController();
  final _formField = GlobalKey();
  int _selectedId = 0;
  bool _firstTimeFlag = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (_firstTimeFlag == false) {
        print('======> Once Executed');
        _firstTimeFlag = true;
        final diaryDetails =
            ModalRoute.of(context)!.settings.arguments as ModelAddNote;

        print('=====> Data Recieved');

        print(diaryDetails.id);
        print(diaryDetails.title);
        print(diaryDetails.description);
        // print(diaryDetails.createdAt);

        _selectedId = diaryDetails.id!;
        controllerTitle.text = diaryDetails.title;
        controllerDescription.text = diaryDetails.description;
      }
    });
  }

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
                _delete();
                print('----------> delete button clicked');
              },
              icon: Icon(Icons.delete)),
          SizedBox(
            width: 15,
          ),
          IconButton(
              onPressed: () {
                print('----------> done button clicked');
                onUpdate();
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

  onUpdate() async {
    Map<String, dynamic> row = {
      DataBaseHelper.columnId: _selectedId,
      DataBaseHelper.columnTitle: controllerTitle.text,
      DataBaseHelper.columnDescription: controllerDescription.text
    };
    final result = await dbhelper.updateDiaryDetails(row);
    print('-------->$result');
    Fluttertoast.showToast(
        msg: 'Updated Successfully',
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.teal,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM);
    Methods.navigateTo(context, HomePage());
  }

  void _delete() async {
    final result = await dbhelper.deleteDiaryDetails(_selectedId);
    print('Result ====>$result');
    Fluttertoast.showToast(
        msg: 'Deleted Successfully',
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.teal,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM);
    Methods.navigateTo(context, HomePage());
  }
}

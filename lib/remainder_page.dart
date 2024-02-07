import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemainderPage extends StatefulWidget {
  const RemainderPage({super.key});

  @override
  State<RemainderPage> createState() => _RemainderPageState();
}

class _RemainderPageState extends State<RemainderPage> {
  bool _defaultSettingsValue = false;

  @override
  void initState() {
    super.initState();
    loadValues();
  }

  loadValues() async {
    final savedValue = await getBool('checkBoxKey');
    setState(() {
      _defaultSettingsValue = savedValue;
    });
    print('value when loaded ---->:$_defaultSettingsValue');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'Contact Details',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                print('Settings Button Clicked------------>');
                _showSettingsDialog(context);
              },
              icon: Icon(Icons.notifications))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(
          Icons.add_alert_sharp,
          color: Colors.white,
        ),
        backgroundColor: Colors.teal,
      ),
    );
  }

  _showSettingsDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (param) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    print('Cancel Button Clicked');
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.teal)),
                ),
                ElevatedButton(
                  onPressed: () {
                    print('Ok Button Clicked');
                    Navigator.pop(context);
                    print('value---------->$_defaultSettingsValue');
                  },
                  child: Text(
                    'Ok',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.teal)),
                ),
              ],
              title: Text(
                'Birthday Remainder Settings',
                style: TextStyle(fontSize: 22),
              ),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Notification',
                    style: TextStyle(fontSize: 19),
                  ),
                  Checkbox(
                    activeColor: Colors.white,
                    checkColor: Colors.teal,
                    value: _defaultSettingsValue,
                    onChanged: (value) {
                      print('CheckBox Clicked $value');
                      setState(() {
                        _defaultSettingsValue = value!;
                        setBool('checkBoxKey', _defaultSettingsValue);
                      });
                    },
                  )
                ],
              ),
            );
          });
        });
  }

  Future<void> setBool(String checkBoxKey, bool checkBoxValue) async {
    final sharedPrefrence = await SharedPreferences.getInstance();
    sharedPrefrence.setBool(checkBoxKey, checkBoxValue);
  }

  static Future<bool> getBool(String checkBoxKey) async {
    final sharedPrefrence = await SharedPreferences.getInstance();
    return sharedPrefrence.getBool(checkBoxKey) ?? false;
  }
}

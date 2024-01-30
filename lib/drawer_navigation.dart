import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/drawer/gf_drawer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_diary_play_store_release/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/widgets.dart';

class DrawerNavigation extends StatefulWidget {
  const DrawerNavigation({super.key});

  @override
  State<DrawerNavigation> createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  final _controllerName = TextEditingController();
  String userName = '';
  File? image;
  late String imagePath;

  var myImagepath;

  late File imageTemp;

  @override
  void initState() {
    super.initState();
    loadValues();
    loadImageSP();
  }

  @override
  Widget build(BuildContext context) {
    return GFDrawer(
      color: Colors.blue.shade50,
      child: ListView(
        children: [
          Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  image != null
                      ? GFAvatar(
                          radius: 80,
                          backgroundImage: FileImage(
                            image!,
                          ),
                        )
                      : CircleAvatar(
                          radius: 80,
                        ),
                  Positioned(
                    bottom: 9,
                    left: 89,
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.teal),
                      child: RawMaterialButton(
                        onPressed: () {},
                        child: IconButton(
                          onPressed: () {
                            print('------------>camera button clicked');
                            showDialogProfile();
                          },
                          icon: Icon(
                            Icons.camera_alt,
                            size: 21,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 250,
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'name',
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            userName,
                            style: TextStyle(fontSize: 22),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        print('---------->Name edit button Clicked');
                        showNameDialog();
                      },
                      icon: Icon(Icons.edit))
                ],
              )
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Divider(
            thickness: 2,
            height: 25,
            indent: 25,
            endIndent: 25,
            color: Colors.teal,
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 65.0),
            child: ListTile(
              leading: Icon(Icons.receipt),
              title: Text('My Diary'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
          ),
          SizedBox(
            height: 15,
            child: Divider(
              indent: 55,
              endIndent: 55,
              thickness: 2,
              color: Colors.teal,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 65.0),
            child: ListTile(
              leading: Icon(Icons.add_alert),
              title: Text('Remainder'),
              onTap: () {},
            ),
          ),
          SizedBox(
            height: 15,
            child: Divider(
              indent: 55,
              endIndent: 55,
              thickness: 2,
              color: Colors.teal,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 65.0),
            child: ListTile(
              leading: Icon(Icons.person_add_alt_1),
              title: Text('Personal'),
              onTap: () {},
            ),
          ),
          SizedBox(
            height: 15,
            child: Divider(
              indent: 55,
              endIndent: 55,
              thickness: 2,
              color: Colors.teal,
            ),
          ),
        ],
      ),
    );
  }

  showDialogProfile() {
    return showModalBottomSheet(
      // isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          height: 150,
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 22.0),
                    child: Text(
                      'Profile Photo',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        print('---------->profile photo delete button clicked');
                      },
                      icon: Icon(Icons.delete))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 19,
                  ),
                  OutlinedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.blue.shade50),
                        shape: MaterialStatePropertyAll(CircleBorder())),
                    onPressed: () {
                      print('---------->profile upload camera button clicked');
                      pickImageCamera();
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.camera_alt),
                  ),
                  SizedBox(
                    width: 19,
                  ),
                  OutlinedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.blue.shade50),
                      shape: MaterialStatePropertyAll(CircleBorder()),
                    ),
                    onPressed: () {
                      print('---------->profile upload gallery button clicked');
                      pickImageGallery();
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.photo,
                      size: 25,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  showNameDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter Your Name'),
          content: TextFormField(
            controller: _controllerName,
            decoration: InputDecoration(
              hintText: 'Enter your name',
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                print('-------->Name Save button clicked');
                _saveName();
              },
              child: Text('Save'),
            ),
            ElevatedButton(
                onPressed: () {
                  print('-------->Name Cancel button clicked');
                  Navigator.pop(context);
                },
                child: Text('Cancel'))
          ],
        );
      },
    );
  }

  _saveName() {
    saveText('username', _controllerName.text);
    Navigator.pop(context);
    loadValues();
  }

  Future<void> saveText(String key, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, value);
  }

  getText(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key);
  }

  loadValues() async {
    final savedUserName = await getText('username');
    setState(() {
      userName = savedUserName;
    });
    print('$userName');
  }

  Future pickImageGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      imageTemp = File(image.path);

      print('Gallery Image Path:');
      print(image.path);

      imagePath = image.path;

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemp = File(image.path);

      print('Camera Image Path:');
      print(image.path);

      imagePath = image.path;

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  saveImageSP() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('profileImage', image?.path ?? '');
  }

  loadImageSP() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      myImagepath = sharedPreferences.getString('profileImage');
      image = myImagepath as File?;
    });
  }
}

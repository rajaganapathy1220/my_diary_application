import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.teal.shade100,
    appBar: AppBar(
      backgroundColor: Colors.teal.shade100,
      title: Text('Help',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    ),
    body: SafeArea(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 45,
            ),
            Text('  * Long Press To share On My Diary Screen',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w400
            ),
            ),
            SizedBox(
              height: 25,
            ),
            Text('* Tap on the List of diary topics  to delete\n or update',
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w400
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text('************',
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w400
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}

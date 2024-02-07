import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/intl.dart';
import 'package:my_diary_play_store_release/database_helper.dart';
import 'package:my_diary_play_store_release/drawer_navigation.dart';
import 'package:my_diary_play_store_release/edit_add_note_page.dart';
import 'package:my_diary_play_store_release/help_page.dart';
import 'package:my_diary_play_store_release/main.dart';
import 'package:my_diary_play_store_release/methods.dart';
import 'package:share_plus/share_plus.dart';
import 'add_note_page.dart';
import 'model_add_note.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ModelAddNote> diaryDetailsList = [];

  @override
  void initState() {
    super.initState();
    getDiaryDetailsRecords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerNavigation(),
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.teal.shade500),
        backgroundColor: Colors.blue.shade50,
        title: Text(
          'My Diary',
          style: TextStyle(color: Colors.teal.shade800),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await refreshData();
          },
          child: ListView.separated(
            itemCount: diaryDetailsList.length,
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              height: 25,
            ),
            itemBuilder: (BuildContext context, int index) {
              DateTime dateTime =
                  DateTime.parse(diaryDetailsList[index].dateTime);
              String formattedYear = DateFormat('yyyy').format(dateTime);

              String formattedMonth = DateFormat('MM').format(dateTime);

              String formattedDate = DateFormat('dd').format(dateTime);

              String formattedTime = DateFormat('HH:mm').format(dateTime);

              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditAddNotePage(),
                      settings:
                          RouteSettings(arguments: diaryDetailsList[index])));
                },
                onLongPress: () {
                  print('------->long press detected');
                  shareDiaryDetails(index);
                },
                child: Container(
                  height: 75,
                  width:double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.teal.shade100,
                  ),
                  margin: EdgeInsets.only(right: 5, left: 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                             formattedMonth,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            Text(formattedDate,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(color: Colors.white)),
                            Text(
                             formattedYear,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(3),
                          color: Colors.teal.shade300,
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                        height: 100,
                        width: 250,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              diaryDetailsList[index].title,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 19),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Text(
                              diaryDetailsList[index].description,
                              style: TextStyle(fontSize: 15),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 75,
                        width: 55,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 1.0),
                          child: Text(
                            // DateTime.parse(M),
                            formattedTime,
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(2),
                            color: Colors.teal.shade300),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIconTheme: IconThemeData(color: Colors.teal.shade50),
        backgroundColor: Colors.teal,
        animatedIcon: AnimatedIcons.menu_arrow,
        childMargin: EdgeInsets.symmetric(vertical: 16),
        children: [
          SpeedDialChild(
              shape: CircleBorder(),
              onTap: () {
                print('-------->Navigate button clicked');

                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddNotePage()));
              },
              child: Icon(
                Icons.add,
                color: Colors.teal.shade50,
              ),
              backgroundColor: Colors.teal),
          SpeedDialChild(
              onTap: () {
                print('-------->help button clicked');
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HelpPage()));
              },
              shape: CircleBorder(),
              child: Icon(
                Icons.help,
                color: Colors.teal.shade50,
              ),
              backgroundColor: Colors.teal)
        ],
      ),
    );
  }

  getDiaryDetailsRecords() async {
    final diaryDetailsRecords =
        await dbhelper.getDiaryDetails(DataBaseHelper.dataBaseDiaryTable);

    diaryDetailsRecords.forEach((diaryDetailsRow) {
      setState(() {
        print(diaryDetailsRow[DataBaseHelper.columnId]);
        print(diaryDetailsRow[DataBaseHelper.columnTitle]);
        print(diaryDetailsRow[DataBaseHelper.columnDescription]);

        var diaryDetailsModel = ModelAddNote(
            diaryDetailsRow[DataBaseHelper.columnId],
            diaryDetailsRow[DataBaseHelper.columnTitle],
            diaryDetailsRow[DataBaseHelper.columnDescription],
            diaryDetailsRow[DataBaseHelper.columnDateTime]);
        // diaryDetailsRow[DataBaseHelper.columnCreatedAt]);
        diaryDetailsList.add(diaryDetailsModel);
      });
    });
  }

  void shareDiaryDetails(int index) {
    String title = diaryDetailsList[index].title;
    String description = diaryDetailsList[index].description;
    String shareText = 'Title: $title\nDescription: $description';

    Share.share(shareText, subject: 'My Diary Entry');
  }

  refreshData() async {
    diaryDetailsList.clear();
    await getDiaryDetailsRecords();
    setState(() {});
  }
}

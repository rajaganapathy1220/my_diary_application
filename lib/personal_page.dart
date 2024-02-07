import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:my_diary_play_store_release/add_personal_page.dart';
import 'package:my_diary_play_store_release/database_helper.dart';
import 'package:my_diary_play_store_release/edit_add_personal_page.dart';
import 'package:my_diary_play_store_release/main.dart';

import 'model_add_basic_info.dart';
import 'model_add_employ_info.dart';
import 'model_add_medical_info.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({super.key});

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<ModelAddBasicInfo> basicInfoList = [];
  List<ModelAddMedicalInfo> medicalInfoList = [];
  List<ModelAddEmployInfo> employInfoList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBasicInfoDetails();
    getMedicalInfoDetails();
    getEmployInfoDetails();

    _tabController = TabController(length: 3, vsync: this);
  }

  getBasicInfoDetails() async {
    final basicInfoTableRecords =
        await dbhelper.getDiaryDetails(DataBaseHelper.dataBaseBasicInfoTable);
    basicInfoTableRecords.forEach((row) {
      setState(() {
        var basicInfoModel = ModelAddBasicInfo(
          row[DataBaseHelper.columnId] ?? '',
          row[DataBaseHelper.columnBasicName] ?? '',
          row[DataBaseHelper.columnBasicPhone] ?? '',
          row[DataBaseHelper.columnBasicDOB] ?? '',
          row[DataBaseHelper.columnBasicAge] ?? '',
          row[DataBaseHelper.columnBasicAddress] ?? '',
          row[DataBaseHelper.columnBasicCity] ?? '',
          row[DataBaseHelper.columnBasicState] ?? '',
          row[DataBaseHelper.columnBasicZIP] ?? '',
          row[DataBaseHelper.columnBasicLicense] ?? '',
          row[DataBaseHelper.columnBasicContact] ?? '',
          row[DataBaseHelper.columnBasicBloodGroup] ?? '',
        );
        basicInfoList.add(basicInfoModel);
      });
    });
  }

  getMedicalInfoDetails() async {
    final medicalInfoRecords =
        await dbhelper.getDiaryDetails(DataBaseHelper.dataBaseMedicalInfoTable);
    medicalInfoRecords.forEach((row) {
      setState(() {
        var medicalInfoModel = ModelAddMedicalInfo(
            row[DataBaseHelper.columnId] ?? '',
            row[DataBaseHelper.columnMedicalName] ?? '',
            row[DataBaseHelper.columnMedicalAddress] ?? '',
            row[DataBaseHelper.columnMedicalCity] ?? '',
            row[DataBaseHelper.columnMedicalState] ?? '',
            row[DataBaseHelper.columnMedicalZIP] ?? '',
            row[DataBaseHelper.columnMedicalPhone] ?? '',
            row[DataBaseHelper.columnMedicalEmail] ?? '',
            row[DataBaseHelper.columnMedicalPolicy] ?? '',
            row[DataBaseHelper.columnMedicalInsurance] ?? '');
        medicalInfoList.add(medicalInfoModel);
      });
    });
  }

  getEmployInfoDetails() async {
    final employInfoRecords =
        await dbhelper.getDiaryDetails(DataBaseHelper.dataBaseEmployInfoTable);

    employInfoRecords.forEach((row) {
      setState(() {
        var employInfoModel = ModelAddEmployInfo(
            row[DataBaseHelper.columnId] ?? '',
            row[DataBaseHelper.columnEmployName] ?? '',
            row[DataBaseHelper.columnEmployAddress] ?? '',
            row[DataBaseHelper.columnEmployCity] ?? '',
            row[DataBaseHelper.columnEmployState] ?? '',
            row[DataBaseHelper.columnEmployZIP] ?? '',
            row[DataBaseHelper.columnEmployPhone ?? ''],
            row[DataBaseHelper.columnEmployEmail] ?? '');
        employInfoList.add(employInfoModel);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade100,
        title: Text('Personal Page'),
        centerTitle: true,
        bottom: TabBar(controller: _tabController, tabs: [
          Tab(
            text: 'Basic Info',
          ),
          Tab(
            text: 'Medical Info',
          ),
          Tab(
            text: 'Employ Info',
          )
        ]),
      ),
      body: TabBarView(controller: _tabController, children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
          child: Container(
            decoration: BoxDecoration(color: Colors.teal),
            child: ListView.builder(
              itemCount: basicInfoList.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditAddPersonalPage(),
                        settings: RouteSettings(
                          arguments: {
                            basicInfoList[index],
                          },
                        ),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 45.0,
                          bottom: 8,
                          top: 8,
                        ),
                        child: Text(
                          basicInfoList[index].basicName,
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 45.0,
                          bottom: 8,
                          top: 8,
                        ),
                        child: Text(
                          basicInfoList[index].basicPhone,
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 45.0,
                          bottom: 8,
                          top: 8,
                        ),
                        child: Text(
                          basicInfoList[index].basicDOB,
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 45.0,
                          bottom: 8,
                          top: 8,
                        ),
                        child: Text(
                          basicInfoList[index].basicAge,
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 45.0,
                          bottom: 8,
                          top: 8,
                        ),
                        child: Text(
                          basicInfoList[index].basicAddress,
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 45.0,
                          bottom: 8,
                          top: 8,
                        ),
                        child: Text(
                          basicInfoList[index].basicCity,
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 45.0,
                          bottom: 8,
                          top: 8,
                        ),
                        child: Text(
                          basicInfoList[index].basicState,
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 45.0,
                          bottom: 8,
                          top: 8,
                        ),
                        child: Text(
                          basicInfoList[index].basicZIP,
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 45.0,
                          bottom: 8,
                          top: 8,
                        ),
                        child: Text(
                          basicInfoList[index].basicLicense,
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 45.0,
                          bottom: 8,
                          top: 8,
                        ),
                        child: Text(
                          basicInfoList[index].basicContact,
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 45.0,
                          bottom: 8,
                          top: 8,
                        ),
                        child: Text(
                          basicInfoList[index].basicBloodGroup,
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Divider(
                        thickness: 9,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
          child: Container(
            decoration: BoxDecoration(color: Colors.teal),
            child: ListView.builder(
                itemCount: medicalInfoList.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditAddPersonalPage(),
                          settings: RouteSettings(
                              arguments: medicalInfoList[index])));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 45.0,
                            bottom: 8,
                            top: 8,
                          ),
                          child: Text(
                            medicalInfoList[index].medicalName,
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 45.0,
                            bottom: 8,
                            top: 8,
                          ),
                          child: Text(
                            medicalInfoList[index].medicalAddress,
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 45.0,
                            bottom: 8,
                            top: 8,
                          ),
                          child: Text(
                            medicalInfoList[index].medicalCity,
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 45.0,
                            bottom: 8,
                            top: 8,
                          ),
                          child: Text(
                            medicalInfoList[index].medicalState,
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 45.0,
                            bottom: 8,
                            top: 8,
                          ),
                          child: Text(
                            medicalInfoList[index].medicalZIP,
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 45.0,
                            bottom: 8,
                            top: 8,
                          ),
                          child: Text(
                            medicalInfoList[index].medicalPhone,
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 45.0,
                            bottom: 8,
                            top: 8,
                          ),
                          child: Text(
                            medicalInfoList[index].medicalEmail,
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 45.0,
                            bottom: 8,
                            top: 8,
                          ),
                          child: Text(
                            medicalInfoList[index].medicalPolicy,
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 45.0,
                            bottom: 8,
                            top: 8,
                          ),
                          child: Text(
                            medicalInfoList[index].medicalInsurance,
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        Divider(
                          thickness: 9,
                        )
                      ],
                    ),
                  );
                }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
          child: Container(
            decoration: BoxDecoration(color: Colors.teal),
            child: ListView.builder(
                itemCount: employInfoList.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditAddPersonalPage(),
                          settings:
                              RouteSettings(arguments: employInfoList[index])));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 45.0,
                            bottom: 8,
                            top: 8,
                          ),
                          child: Text(
                            employInfoList[index].employName,
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 45.0,
                            bottom: 8,
                            top: 8,
                          ),
                          child: Text(
                            employInfoList[index].employAddress,
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 45.0,
                            bottom: 8,
                            top: 8,
                          ),
                          child: Text(
                            employInfoList[index].employCity,
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 45.0,
                            bottom: 8,
                            top: 8,
                          ),
                          child: Text(
                            employInfoList[index].employState,
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 45.0,
                            bottom: 8,
                            top: 8,
                          ),
                          child: Text(
                            employInfoList[index].employZIP,
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 45.0,
                            bottom: 8,
                            top: 8,
                          ),
                          child: Text(
                            employInfoList[index].employPhone,
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 45.0,
                            bottom: 8,
                            top: 8,
                          ),
                          child: Text(
                            employInfoList[index].employEmail,
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        Divider(
                          thickness: 9,
                        )
                      ],
                    ),
                  );
                }),
          ),
        ),
      ]),
      floatingActionButton: SpeedDial(
        animatedIconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.teal.shade200,
        animatedIcon: AnimatedIcons.menu_arrow,
        childMargin: EdgeInsets.symmetric(vertical: 16),
        children: [
          SpeedDialChild(
              shape: CircleBorder(),
              onTap: () {
                print('Add Personal info Page Clicked');
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddPersonalPage()));
              },
              child: Icon(
                Icons.add,
                color: Colors.teal.shade50,
              ),
              backgroundColor: Colors.teal),
        ],
      ),
    );
  }
}

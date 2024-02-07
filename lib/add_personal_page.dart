import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_diary_play_store_release/database_helper.dart';
import 'package:my_diary_play_store_release/main.dart';
import 'package:my_diary_play_store_release/personal_page.dart';

import 'methods.dart';

class AddPersonalPage extends StatefulWidget {
  const AddPersonalPage({super.key});

  @override
  State<AddPersonalPage> createState() => _AddPersonalPageState();
}

class _AddPersonalPageState extends State<AddPersonalPage> {
  var _selectedAge;
  var _selectedStateBasic;
  var _selectedCityBasic;
  var _selectedStateMedical;
  var _selectedCityMedical;
  var _selectedStateEmploy;
  var _selectedCityEmploy;

  //Basic Table
  var _controllerBasicName = TextEditingController();
  var _controllerBasicPhone = TextEditingController();
  var _controllerBasicDOB = TextEditingController();
  var _controllerBasicAddress = TextEditingController();
  var _controllerBasicZIP = TextEditingController();
  var _controllerBasicLicense = TextEditingController();
  var _controllerBasicContact = TextEditingController();
  var _controllerBasicBloodGroup = TextEditingController();

//Medical Table
  var _controllerMedicalName = TextEditingController();
  var _controllerMedicalAddress = TextEditingController();
  var _controllerMedicalZIP = TextEditingController();
  var _controllerMedicalPhone = TextEditingController();
  var _controllerMedicalEmail = TextEditingController();
  var _controllerMedicalPolicy = TextEditingController();
  var _controllerMedicalInsurance = TextEditingController();

  //Employment
  var _controllerEmployName = TextEditingController();
  var _controllerEmployAddress = TextEditingController();
  var _controllerEmployZip = TextEditingController();
  var _controllerEmployPhone = TextEditingController();
  var _controllerEmployEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Text('Add Personal Information'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade50,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 25,
              ),
              Center(
                child: Container(
                  height: 670,
                  width: 390,
                  decoration: BoxDecoration(
                      color: Colors.teal.shade100,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: 390,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.teal.shade500,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          'Basic Information',
                          style: TextStyle(fontSize: 19, color: Colors.white70),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: TextFormField(
                          controller: _controllerBasicName,
                          decoration: InputDecoration(
                              hintText: 'Name', icon: Icon(Icons.person)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: TextFormField(
                          controller: _controllerBasicPhone,
                          decoration: InputDecoration(
                              hintText: 'Phone', icon: Icon(Icons.phone)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: TextFormField(
                          controller: _controllerBasicDOB,
                          decoration: InputDecoration(
                              hintText: 'DOB',
                              icon: Icon(Icons.date_range_outlined)),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.add_circle_outline),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Age : ',
                            style: TextStyle(fontSize: 19),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          DropdownButton(
                            value: _selectedAge,
                            hint: Text('Select Age'),
                            items: <String>[
                              '1',
                              '2',
                              '3',
                              '4',
                              '5',
                              '6',
                              '7',
                              '8',
                              '9',
                              '10',
                              '11',
                              '12',
                              '13',
                              '14',
                              '15',
                              '16',
                              '17',
                              '18',
                              '19',
                              '20',
                              '21',
                              '22',
                              '23',
                              '24',
                              '25',
                              '26',
                              '27',
                              '28',
                              '29',
                              '30',
                              '31',
                              '32',
                              '33',
                              '34',
                              '35',
                              '36',
                              '37',
                              '38',
                              '39',
                              '40',
                              '41',
                              '42',
                              '43',
                              '44',
                              '45',
                              '46',
                              '47',
                              '48',
                              '49',
                              '50',
                              '51',
                              '52',
                              '53',
                              '54',
                              '55',
                              '56',
                              '57',
                              '58',
                              '59',
                              '60',
                              '61',
                              '62',
                              '63',
                              '64',
                              '65',
                              '66',
                              '67',
                              '68',
                              '69',
                              '70',
                              '71',
                              '72',
                              '73',
                              '74',
                              '75',
                              '76',
                              '77',
                              '78',
                              '79',
                              '80',
                              '81',
                              '82',
                              '83',
                              '84',
                              '85',
                              '86',
                              '87',
                              '88',
                              '89',
                              '90',
                            ].map(
                              (String value) {
                                return DropdownMenuItem(
                                    value: value, child: Text(value));
                              },
                            ).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedAge = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.black87,
                        indent: 42,
                        endIndent: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: TextFormField(
                          controller: _controllerBasicAddress,
                          decoration: InputDecoration(
                              hintText: 'Address',
                              icon: Icon(Icons.location_pin)),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.add_circle_outline),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'City : ',
                            style: TextStyle(fontSize: 19),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          DropdownButton(
                            value: _selectedCityBasic,
                            hint: Text('Select City'),
                            items: <String>[
                              'Mumbai',
                              'Delhi',
                              'Bengaluru',
                              'Hyderabad',
                              'Ahmedabad',
                              'Chennai',
                              'Surat',
                              'Pune',
                              'Lucknow',
                              'Kanpur',
                              'Nagpur',
                              'Indore',
                              'Thane',
                              'Bhopal',
                              'Visakhapatnam',
                              'Pimpri-Chinchwad',
                              'Patna',
                              'Vadodara',
                              'Ghaziabad',
                              'Ludhiana',
                              'Agra',
                              'Nashik',
                              'Ranchi',
                              'Faridabad',
                              'Meerut',
                              'Rajkot',
                              'Kalyan-Dombivli',
                              'Vasai-Virar',
                              'Varanasi',
                              'Srinagar',
                              'Aurangabad',
                              'Dhanbad',
                              'Amritsar',
                              'Navi Mumbai',
                              'Allahabad',
                              'Ranchi',
                              'Howrah',
                              'Coimbatore',
                              'Jabalpur',
                              'Gwalior',
                              'Vijayawada',
                              'Jodhpur',
                              'Madurai',
                              'Raipur',
                              'Kota',
                              'Chandrapur',
                            ].map(
                              (String value) {
                                return DropdownMenuItem(
                                    value: value, child: Text(value));
                              },
                            ).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedCityBasic = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.black87,
                        indent: 42,
                        endIndent: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.add_circle_outline),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'State : ',
                            style: TextStyle(fontSize: 19),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          DropdownButton(
                            value: _selectedStateBasic,
                            hint: Text('Select State'),
                            items: <String>[
                              'Andhra Pradesh',
                              'Arunachal Pradesh',
                              'Assam',
                              'Bihar',
                              'Chhattisgarh',
                              'Goa',
                              'Gujarat',
                              'Haryana',
                              'Himachal Pradesh',
                              'Jharkhand',
                              'Karnataka',
                              'Kerala',
                              'Madhya Pradesh',
                              'Maharashtra',
                              'Manipur',
                              'Meghalaya',
                              'Mizoram',
                              'Nagaland',
                              'Odisha',
                              'Punjab',
                              'Rajasthan',
                              'Sikkim',
                              'Tamil Nadu',
                              'Telangana',
                              'Tripura',
                              'Uttar Pradesh',
                              'Uttarakhand',
                              'West Bengal',
                              'Andaman and Nicobar Islands',
                              'Chandigarh',
                              'Dadra and Nagar,Daman and Diu',
                              'Lakshadweep',
                              'Delhi',
                              'Puducherry'
                            ].map(
                              (String value) {
                                return DropdownMenuItem(
                                    value: value, child: Text(value));
                              },
                            ).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedStateBasic = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.black87,
                        indent: 42,
                        endIndent: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: TextFormField(
                          controller: _controllerBasicZIP,
                          decoration: InputDecoration(
                              hintText: 'ZIP', icon: Icon(Icons.numbers)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: TextFormField(
                          controller: _controllerBasicLicense,
                          decoration: InputDecoration(
                              hintText: 'License No',
                              icon: Icon(Icons.confirmation_number)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: TextFormField(
                          controller: _controllerBasicContact,
                          decoration: InputDecoration(
                              hintText: 'Contact',
                              icon: Icon(Icons.contact_phone)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: TextFormField(
                          controller: _controllerBasicBloodGroup,
                          decoration: InputDecoration(
                              hintText: 'Blood Group',
                              icon: Icon(Icons.bloodtype)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 45,
              ),
              Center(
                child: Container(
                  height: 545,
                  width: 390,
                  decoration: BoxDecoration(
                      color: Colors.teal.shade100,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: 390,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.teal.shade500,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          'Medical Information',
                          style: TextStyle(fontSize: 19, color: Colors.white70),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: TextFormField(
                          controller: _controllerMedicalName,
                          decoration: InputDecoration(
                              hintText: 'Doctor name',
                              icon: Icon(Icons.person)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: TextFormField(
                          controller: _controllerMedicalAddress,
                          decoration: InputDecoration(
                              hintText: 'Address',
                              icon: Icon(Icons.location_pin)),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.add_circle_outline),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'City : ',
                            style: TextStyle(fontSize: 19),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          DropdownButton(
                            value: _selectedCityMedical,
                            hint: Text('Select City'),
                            items: <String>[
                              'Mumbai',
                              'Delhi',
                              'Bengaluru',
                              'Hyderabad',
                              'Ahmedabad',
                              'Chennai',
                              'Surat',
                              'Pune',
                              'Lucknow',
                              'Kanpur',
                              'Nagpur',
                              'Indore',
                              'Thane',
                              'Bhopal',
                              'Visakhapatnam',
                              'Pimpri-Chinchwad',
                              'Patna',
                              'Vadodara',
                              'Ghaziabad',
                              'Ludhiana',
                              'Agra',
                              'Nashik',
                              'Ranchi',
                              'Faridabad',
                              'Meerut',
                              'Rajkot',
                              'Kalyan-Dombivli',
                              'Vasai-Virar',
                              'Varanasi',
                              'Srinagar',
                              'Aurangabad',
                              'Dhanbad',
                              'Amritsar',
                              'Navi Mumbai',
                              'Allahabad',
                              'Ranchi',
                              'Howrah',
                              'Coimbatore',
                              'Jabalpur',
                              'Gwalior',
                              'Vijayawada',
                              'Jodhpur',
                              'Madurai',
                              'Raipur',
                              'Kota',
                              'Chandrapur',
                            ].map(
                              (String value) {
                                return DropdownMenuItem(
                                    value: value, child: Text(value));
                              },
                            ).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedCityMedical = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.black87,
                        indent: 42,
                        endIndent: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.add_circle_outline),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'State : ',
                            style: TextStyle(fontSize: 19),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          DropdownButton(
                            value: _selectedStateMedical,
                            hint: Text('Select State'),
                            items: <String>[
                              'Andhra Pradesh',
                              'Arunachal Pradesh',
                              'Assam',
                              'Bihar',
                              'Chhattisgarh',
                              'Goa',
                              'Gujarat',
                              'Haryana',
                              'Himachal Pradesh',
                              'Jharkhand',
                              'Karnataka',
                              'Kerala',
                              'Madhya Pradesh',
                              'Maharashtra',
                              'Manipur',
                              'Meghalaya',
                              'Mizoram',
                              'Nagaland',
                              'Odisha',
                              'Punjab',
                              'Rajasthan',
                              'Sikkim',
                              'Tamil Nadu',
                              'Telangana',
                              'Tripura',
                              'Uttar Pradesh',
                              'Uttarakhand',
                              'West Bengal',
                              'Andaman and Nicobar Islands',
                              'Chandigarh',
                              'Dadra and Nagar,Daman and Diu',
                              'Lakshadweep',
                              'Delhi',
                              'Puducherry'
                            ].map(
                              (String value) {
                                return DropdownMenuItem(
                                    value: value, child: Text(value));
                              },
                            ).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedStateMedical = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.black87,
                        indent: 42,
                        endIndent: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: TextFormField(
                          controller: _controllerMedicalZIP,
                          decoration: InputDecoration(
                              hintText: 'ZIP',
                              icon: Icon(Icons.numbers_rounded)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: TextFormField(
                          controller: _controllerMedicalPhone,
                          decoration: InputDecoration(
                              hintText: 'Phone', icon: Icon(Icons.phone)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: TextFormField(
                          controller: _controllerMedicalEmail,
                          decoration: InputDecoration(
                              hintText: 'Dr.Email', icon: Icon(Icons.person)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: TextFormField(
                          controller: _controllerMedicalPolicy,
                          decoration: InputDecoration(
                              hintText: 'Policy No', icon: Icon(Icons.policy)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: TextFormField(
                          controller: _controllerMedicalInsurance,
                          decoration: InputDecoration(
                              hintText: 'Insurance Company',
                              icon: Icon(Icons.monetization_on)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 45,
              ),
              Center(
                child: Container(
                  height: 449,
                  width: 390,
                  decoration: BoxDecoration(
                      color: Colors.teal.shade100,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: 390,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.teal.shade500,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          'Employment Information',
                          style: TextStyle(fontSize: 19, color: Colors.white70),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: TextFormField(
                          controller: _controllerEmployName,
                          decoration: InputDecoration(
                              hintText: 'Employer', icon: Icon(Icons.work)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: TextFormField(
                          controller: _controllerEmployAddress,
                          decoration: InputDecoration(
                              hintText: 'Address',
                              icon: Icon(Icons.location_pin)),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.add_circle_outline),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'City : ',
                            style: TextStyle(fontSize: 19),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          DropdownButton(
                            value: _selectedCityEmploy,
                            hint: Text('Select City'),
                            items: <String>[
                              'Mumbai',
                              'Delhi',
                              'Bengaluru',
                              'Hyderabad',
                              'Ahmedabad',
                              'Chennai',
                              'Surat',
                              'Pune',
                              'Lucknow',
                              'Kanpur',
                              'Nagpur',
                              'Indore',
                              'Thane',
                              'Bhopal',
                              'Visakhapatnam',
                              'Pimpri-Chinchwad',
                              'Patna',
                              'Vadodara',
                              'Ghaziabad',
                              'Ludhiana',
                              'Agra',
                              'Nashik',
                              'Ranchi',
                              'Faridabad',
                              'Meerut',
                              'Rajkot',
                              'Kalyan-Dombivli',
                              'Vasai-Virar',
                              'Varanasi',
                              'Srinagar',
                              'Aurangabad',
                              'Dhanbad',
                              'Amritsar',
                              'Navi Mumbai',
                              'Allahabad',
                              'Ranchi',
                              'Howrah',
                              'Coimbatore',
                              'Jabalpur',
                              'Gwalior',
                              'Vijayawada',
                              'Jodhpur',
                              'Madurai',
                              'Raipur',
                              'Kota',
                              'Chandrapur',
                            ].map(
                              (String value) {
                                return DropdownMenuItem(
                                    value: value, child: Text(value));
                              },
                            ).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedCityEmploy = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.black87,
                        indent: 42,
                        endIndent: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.add_circle_outline),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'State : ',
                            style: TextStyle(fontSize: 19),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          DropdownButton(
                            value: _selectedStateEmploy,
                            hint: Text('Select State'),
                            items: <String>[
                              'Andhra Pradesh',
                              'Arunachal Pradesh',
                              'Assam',
                              'Bihar',
                              'Chhattisgarh',
                              'Goa',
                              'Gujarat',
                              'Haryana',
                              'Himachal Pradesh',
                              'Jharkhand',
                              'Karnataka',
                              'Kerala',
                              'Madhya Pradesh',
                              'Maharashtra',
                              'Manipur',
                              'Meghalaya',
                              'Mizoram',
                              'Nagaland',
                              'Odisha',
                              'Punjab',
                              'Rajasthan',
                              'Sikkim',
                              'Tamil Nadu',
                              'Telangana',
                              'Tripura',
                              'Uttar Pradesh',
                              'Uttarakhand',
                              'West Bengal',
                              'Andaman and Nicobar Islands',
                              'Chandigarh',
                              'Dadra and Nagar,Daman and Diu',
                              'Lakshadweep',
                              'Delhi',
                              'Puducherry'
                            ].map(
                              (String value) {
                                return DropdownMenuItem(
                                    value: value, child: Text(value));
                              },
                            ).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedStateEmploy = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.black87,
                        indent: 42,
                        endIndent: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: TextFormField(
                          controller: _controllerEmployZip,
                          decoration: InputDecoration(
                              hintText: 'ZIP', icon: Icon(Icons.numbers)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: TextFormField(
                          controller: _controllerEmployPhone,
                          decoration: InputDecoration(
                              hintText: 'Phone', icon: Icon(Icons.phone)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: TextFormField(
                          controller: _controllerEmployEmail,
                          decoration: InputDecoration(
                              hintText: 'Email', icon: Icon(Icons.email)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              OutlinedButton(
                onPressed: () {
                  onSave();
                  print('Save button clicked');
                },
                child: Text('Save'),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.teal.shade200)),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  onSave() async {
    Map<String, dynamic> basicRow = {
      DataBaseHelper.columnBasicName: _controllerBasicName.text,
      DataBaseHelper.columnBasicPhone: _controllerBasicPhone.text,
      DataBaseHelper.columnBasicDOB: _controllerBasicDOB.text,
      DataBaseHelper.columnBasicAge: _selectedAge,
      DataBaseHelper.columnBasicAddress: _controllerBasicAddress.text,
      DataBaseHelper.columnBasicCity: _selectedCityBasic,
      DataBaseHelper.columnBasicState: _selectedStateBasic,
      DataBaseHelper.columnBasicZIP: _controllerBasicZIP.text,
      DataBaseHelper.columnBasicLicense: _controllerBasicLicense.text,
      DataBaseHelper.columnBasicContact: _controllerBasicContact.text,
      DataBaseHelper.columnBasicBloodGroup: _controllerBasicBloodGroup.text
    };
    final resultbasicRow = await dbhelper.insertDiaryDetails(
        basicRow, DataBaseHelper.dataBaseBasicInfoTable);
    print('inserted row -----> $resultbasicRow');

    Map<String, dynamic> medicalRow = {
      DataBaseHelper.columnMedicalName: _controllerMedicalName.text,
      DataBaseHelper.columnMedicalAddress: _controllerMedicalAddress.text,
      DataBaseHelper.columnMedicalCity: _selectedCityMedical,
      DataBaseHelper.columnMedicalState: _selectedStateMedical,
      DataBaseHelper.columnMedicalZIP: _controllerMedicalZIP.text,
      DataBaseHelper.columnMedicalPhone: _controllerMedicalPhone.text,
      DataBaseHelper.columnMedicalEmail: _controllerMedicalEmail.text,
      DataBaseHelper.columnMedicalPolicy: _controllerMedicalPolicy.text,
      DataBaseHelper.columnMedicalInsurance: _controllerMedicalInsurance.text
    };
    final resultmedicalRow = await dbhelper.insertDiaryDetails(
        medicalRow, DataBaseHelper.dataBaseMedicalInfoTable);
    print('inserted row -----> $resultmedicalRow');

    Map<String, dynamic> employRow = {
      DataBaseHelper.columnEmployName: _controllerEmployName.text,
      DataBaseHelper.columnEmployAddress: _controllerEmployAddress.text,
      DataBaseHelper.columnEmployCity: _selectedCityEmploy,
      DataBaseHelper.columnEmployState: _selectedStateEmploy,
      DataBaseHelper.columnEmployZIP: _controllerEmployZip.text,
      DataBaseHelper.columnEmployPhone: _controllerEmployPhone.text,
      DataBaseHelper.columnEmployEmail: _controllerEmployEmail.text
    };
    final resultEmployRow = await dbhelper.insertDiaryDetails(
        employRow, DataBaseHelper.dataBaseEmployInfoTable);
    print("Inserted Row : $resultEmployRow");
    Methods.navigateTo(context, PersonalPage());
    Methods.toastMessage('Saved Successfully');
  }
}

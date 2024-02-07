import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_diary_play_store_release/database_helper.dart';
import 'package:my_diary_play_store_release/main.dart';
import 'package:my_diary_play_store_release/model_add_basic_info.dart';
import 'package:my_diary_play_store_release/model_add_employ_info.dart';
import 'package:my_diary_play_store_release/model_add_medical_info.dart';
import 'package:my_diary_play_store_release/personal_page.dart';

import 'methods.dart';

class EditAddPersonalPage extends StatefulWidget {
  const EditAddPersonalPage({super.key});

  @override
  State<EditAddPersonalPage> createState() => _EditAddPersonalPageState();
}

class _EditAddPersonalPageState extends State<EditAddPersonalPage> {
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

  bool _firstTimeFlag = false;
  int _selectedId = 0;

  @override
  Widget build(BuildContext context) {

      if (_firstTimeFlag == false) {
        print('one time executed');
        _firstTimeFlag = true;

        final args = ModalRoute.of(context)!.settings.arguments;

        if (args is ModelAddBasicInfo) {
          final basicDetails = args;
          print('Data Received');
          _selectedId = basicDetails.id!;
          _controllerBasicName.text = basicDetails.basicName;
          _controllerBasicPhone.text = basicDetails.basicPhone;
          _controllerBasicDOB.text = basicDetails.basicDOB;
          //_selectedAge = basicDetails.basicAge;
          _controllerBasicAddress.text = basicDetails.basicAddress;
          //_selectedCityBasic = basicDetails.basicCity;
         // _selectedStateBasic = basicDetails.basicState;
          _controllerBasicZIP.text = basicDetails.basicZIP;
          _controllerBasicLicense.text = basicDetails.basicLicense;
          _controllerBasicContact.text = basicDetails.basicContact;
          _controllerBasicBloodGroup.text = basicDetails.basicBloodGroup;
        } else if (args is ModelAddMedicalInfo) {
          print('Data Received');
          final medicalDetails = args;
          _selectedId = medicalDetails.id!;
          _controllerMedicalName.text = medicalDetails.medicalName;
          _controllerMedicalAddress.text = medicalDetails.medicalAddress;
         // _selectedCityMedical = medicalDetails.medicalCity;
          //_selectedStateMedical = medicalDetails.medicalState;
          _controllerMedicalZIP.text = medicalDetails.medicalZIP;
          _controllerMedicalPhone.text = medicalDetails.medicalPhone;
          _controllerMedicalEmail.text = medicalDetails.medicalEmail;
          _controllerMedicalPolicy.text = medicalDetails.medicalPolicy;
          _controllerMedicalInsurance.text = medicalDetails.medicalInsurance;

        }else  if (args is ModelAddEmployInfo) {
          print('Data Received');
          final employDetails = args;
          _selectedId = employDetails.id!;
          _controllerEmployName.text = employDetails.employName;
          _controllerEmployAddress.text = employDetails.employAddress;
          //_selectedCityEmploy = employDetails.employCity;
        //  _selectedStateEmploy = employDetails.employState;
          _controllerEmployZip.text = employDetails.employZIP;
          _controllerEmployPhone.text = employDetails.employPhone;
          _controllerEmployEmail.text = employDetails.employEmail;
        }
      }


      //basicDetails



    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Text('Add Personal Information'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade50,
        actions: [
          IconButton(onPressed: () {
            deleteBasic();
            deleteEmploy();
            deleteMedical();
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PersonalPage()));
          }, icon: Icon(Icons.delete))
        ],
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
                  onUpdate();
                  print('Update button clicked');
                },
                child: Text('Update'),
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

  onUpdate() async {
    Map<String, dynamic> basicRow = {
      DataBaseHelper.columnId:_selectedId,
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
    final resultbasicRow = await dbhelper.updateDiaryDetails(
        basicRow, DataBaseHelper.dataBaseBasicInfoTable);
    print('inserted row -----> $resultbasicRow');

    Map<String, dynamic> medicalRow = {
      DataBaseHelper.columnId:_selectedId,
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
    final resultmedicalRow = await dbhelper.updateDiaryDetails(
        medicalRow, DataBaseHelper.dataBaseMedicalInfoTable);
    print('inserted row -----> $resultmedicalRow');

    Map<String, dynamic> employRow = {
      DataBaseHelper.columnId:_selectedId,
      DataBaseHelper.columnEmployName: _controllerEmployName.text,
      DataBaseHelper.columnEmployAddress: _controllerEmployAddress.text,
      DataBaseHelper.columnEmployCity: _selectedCityEmploy,
      DataBaseHelper.columnEmployState: _selectedStateEmploy,
      DataBaseHelper.columnEmployZIP: _controllerEmployZip.text,
      DataBaseHelper.columnEmployPhone: _controllerEmployPhone.text,
      DataBaseHelper.columnEmployEmail: _controllerEmployEmail.text
    };
    final resultEmployRow = await dbhelper.updateDiaryDetails(
        employRow, DataBaseHelper.dataBaseEmployInfoTable);
    print("Inserted Row : $resultEmployRow");
    Methods.navigateTo(context, PersonalPage());
    Methods.toastMessage('Updated Successfully');
  }
  deleteEmploy()async{
await dbhelper.deleteDiaryDetails(_selectedId, DataBaseHelper.dataBaseEmployInfoTable);
  }
  deleteBasic()async{
    await dbhelper.deleteDiaryDetails(_selectedId, DataBaseHelper.dataBaseBasicInfoTable);
  }
  deleteMedical()async{
    await dbhelper.deleteDiaryDetails(_selectedId, DataBaseHelper.dataBaseMedicalInfoTable);
  }
}

import 'dart:ui';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rwf_hospital_registration/patientloginpage.dart';
import 'constants.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

final _rkey = GlobalKey<FormState>();
String _regusername = '';
String _regpassword = '';
bool securetext = true;
String _regphonenum = '';

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital Registration'),
        backgroundColor: kAppBar,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          )
        ],
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Form(
            key: _rkey,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        'User ID',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 18.0,
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "User ID cannot be empty";
                          } else if (value.length <= 5) {
                            return "User ID show be greater than 5";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) async {
                          _regusername = value.toString();
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        'DOB',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 18.0,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 30.0),
                        child: DateTimePicker(
                          type: DateTimePickerType.date,
                          dateMask: 'd MMM, yyyy',
                          initialValue: DateTime.now().toString(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime.now(),
                          icon: Icon(Icons.event),
                          dateLabelText: 'Date',
                          selectableDayPredicate: (date) {
                            // Disable weekend days to select from the calendar
                            if (date.weekday == 6 || date.weekday == 7) {
                              return false;
                            }

                            return true;
                          },
                          onChanged: (val) => print(val),
                          validator: (val) {
                            print(val);
                            return null;
                          },
                          onSaved: (val) => print(val),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        'Phone Number',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 18.0,
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Phone Number";
                          } else if (value.length != 10) {
                            return "Enter correct number";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) async {
                          _regphonenum = value.toString();
                        },
                        decoration: InputDecoration(prefixText: '+91'),
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        'Password',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 18.0,
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(securetext
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                securetext = !securetext;
                              });
                            },
                          ),
                        ),
                        obscureText: securetext,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password is required";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) async {
                          _regpassword = value.toString();
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: SizedBox(
                    height: 50.0,
                    width: 140.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: kButtonColor, // background
                        onPrimary: Colors.black, // foreground
                      ),
                      onPressed: () {
                        if (_rkey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return PatientLoginPage();
                              },
                            ),
                          );
                        }
                        _rkey.currentState!.save();
                        print(_regusername);
                        print(_regpassword);
                        print(_regphonenum);
                      },
                      child: Text("LOGIN"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Padding(
// padding: const EdgeInsets.all(30.0),
// child: SingleChildScrollView(
// child: Form(
// child: Column(
// children: [
// Container(
// margin: EdgeInsets.all(7.0),
// child: Column(
// children: [
// Text(
// 'OPD ID',
// textAlign: TextAlign.left,
// style: TextStyle(
// color: kTextColor,
// fontSize: 18.0,
// ),
// ),
// TextFormField(
// decoration: InputDecoration(
// hintText: 'Enter the OPD ID',
// border: UnderlineInputBorder(),
// ),
// ),
// ],
// ),
// ),
// Container(
// margin: EdgeInsets.all(7.0),
// child: Column(
// children: [
// Text(
// 'DOB',
// textAlign: TextAlign.left,
// style: TextStyle(
// color: kTextColor,
// fontSize: 18.0,
// ),
// ),
// TextFormField(
// decoration: InputDecoration(
// hintText: 'DD/MM/YYYY',
// border: UnderlineInputBorder(),
// suffixIcon: IconButton(
// icon: Icon(
// Icons.calendar_today_outlined,
// ),
// onPressed: () async {
// var selecteddate = await showDatePicker(
// context: context,
// initialDate: DateTime.now(),
// firstDate: DateTime(1900),
// lastDate: DateTime.now(),
// );
// },
// ),
// ),
// ),
// ],
// ),
// ),
// Container(
// margin: EdgeInsets.all(7.0),
// child: Column(
// children: [
// Text(
// 'Phone Number',
// textAlign: TextAlign.left,
// style: TextStyle(
// color: kTextColor,
// fontSize: 18.0,
// ),
// ),
// TextFormField(
// decoration: InputDecoration(prefixText: '+91'),
// keyboardType: TextInputType.number,
// ),
// ],
// ),
// ),
// Container(
// margin: EdgeInsets.all(7.0),
// child: Column(
// children: [
// Text(
// 'Password',
// textAlign: TextAlign.left,
// style: TextStyle(
// color: kTextColor,
// fontSize: 18.0,
// ),
// ),
// TextFormField(
// decoration: InputDecoration(
// suffixIcon: IconButton(
// icon: Icon(securetext
// ? Icons.visibility_off
//     : Icons.visibility),
// onPressed: () {
// setState(() {
// securetext = !securetext;
// });
// },
// ),
// ),
// obscureText: securetext,
// ),
// ],
// ),
// ),
// Container(
// margin: EdgeInsets.all(25.0),
// child: SizedBox(
// height: 50.0,
// width: 150.0,
// child: ElevatedButton(
// style: ElevatedButton.styleFrom(
// primary: kButtonColor, // background
// onPrimary: Colors.black, // foreground
// ),
// onPressed: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) {
// return PatientLoginPage();
// },
// ),
// );
// },
// child: Text('SIGN UP'),
// ),
// ),
// ),
// ],
// ),
// ),
// ),
// ),

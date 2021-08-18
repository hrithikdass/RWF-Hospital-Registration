import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

final _rkey = GlobalKey<FormState>();
// DateTime _dateTime;
String _regusername = '';
String _regpassword = '';
bool securetext = true;
String _regphonenum = '';

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital Management'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Form(
            key: _rkey,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20.0),
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
                  margin: EdgeInsets.all(20.0),
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
                  margin: EdgeInsets.all(20.0),
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
                  margin: EdgeInsets.all(20.0),
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
                  margin: EdgeInsets.all(20.0),
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
                          print('data is submitted');
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

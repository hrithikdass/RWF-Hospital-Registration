import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rwf_hospital_registration/patientloginpage.dart';
import 'constants.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

bool securetext = true;

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital Management'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(7.0),
                child: Column(
                  children: [
                    Text(
                      'OPD ID',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: kTextColor,
                        fontSize: 18.0,
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter the OPD ID',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(7.0),
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
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'DD/MM/YYYY',
                        border: UnderlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.calendar_today_outlined,
                          ),
                          onPressed: () {
                            showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now());
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(7.0),
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
                    TextField(
                      decoration: InputDecoration(prefixText: '+91'),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(7.0),
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
                    TextField(
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
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(25.0),
                child: SizedBox(
                  height: 50.0,
                  width: 150.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: kButtonColor, // background
                      onPrimary: Colors.black, // foreground
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return PatientLoginPage();
                          },
                        ),
                      );
                    },
                    child: Text('SIGN UP'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

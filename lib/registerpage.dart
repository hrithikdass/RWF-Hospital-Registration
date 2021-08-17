import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital Management'),
      ),
      body: Column(
        children: [
          Container(
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
        ],
      ),
    );
  }
}

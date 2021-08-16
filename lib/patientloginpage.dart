import 'package:flutter/material.dart';
import 'constants.dart';

class PatientLoginPage extends StatelessWidget {
  const PatientLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital Management'),
      ),
      body: Column(
        children: [
          Text(
            'User ID',
            style: TextStyle(
              color: kTextColor,
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter the User ID',
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Password',
            ),
          ),
        ],
      ),
    );
  }
}

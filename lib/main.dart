import 'package:flutter/material.dart';
import 'package:rwf_hospital_registration/patientloginpage.dart';
import 'package:rwf_hospital_registration/welcomepage.dart';
import 'homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RWF Hospital registration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/Welcome': (context) => WelcomePage(),
        '/Patientlogi': (context) => PatientLoginPage(),
      },
    );
  }
}

/* colors app bar: 3F51B5
button : FF4181
text : EA4B81
 */

import 'package:flutter/material.dart';
import 'package:rwf_hospital_registration/doctorlogin.dart';
import 'package:rwf_hospital_registration/docviewappointment.dart';
import 'package:rwf_hospital_registration/myappointment.dart';
import 'package:rwf_hospital_registration/patientloginpage.dart';
import 'package:rwf_hospital_registration/registerpage.dart';
import 'package:rwf_hospital_registration/statuspage.dart';
import 'package:rwf_hospital_registration/welcomedoctor.dart';
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
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/Welcome': (context) => WelcomePage(
              userid: '',
            ),
        '/Patientlogin': (context) => PatientLogin(),
        '/Register': (context) => RegisterApp(),
        '/Status': (context) => StatusPage(
              userid: '',
            ),
        '/doctor': (context) => WelcomeDoctor(
              duserid: '',
            ),
        '/doctorlogin': (context) => DoctorLogin(),
        '/myappointment': (context) => MyAppointment(
              userid: '',
            ),
        '/docviewappointment': (context) => DocViewAppointment(
              duserid: '',
            ),
      },
    );
  }
}

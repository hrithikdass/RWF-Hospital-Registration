import 'package:flutter/material.dart';
import 'constants.dart';

class WelcomeDoctor extends StatefulWidget {
  const WelcomeDoctor({Key? key}) : super(key: key);

  @override
  _WelcomeDoctorState createState() => _WelcomeDoctorState();
}

class _WelcomeDoctorState extends State<WelcomeDoctor> {
  var docname = "Default";

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
          margin: EdgeInsets.all(35.0),
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        "Welcome!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                          color: kTextColor,
                        ),
                      ),
                      Text(
                        docname,
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100.0,
                ),
                Column(
                  children: [
                    Icon(
                      Icons.bookmark,
                      color: kAppBar,
                      size: 50.0,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Appointments',
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                    Text(
                      'Patient Appointment',
                      style: TextStyle(
                        color: kTextLight,
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

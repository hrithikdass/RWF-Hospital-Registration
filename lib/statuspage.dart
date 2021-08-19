import 'package:flutter/material.dart';
import 'package:rwf_hospital_registration/bookappointment.dart';
import 'constants.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital Management'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 100.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.menu_book,
                        color: kAppBar,
                        size: 50.0,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return BookAppointment();
                              },
                            ),
                          );
                        },
                        child: Text(
                          'Book My Appointment',
                          style: TextStyle(
                            color: kTextColor,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Text(
                        'Book Appointment',
                        style: TextStyle(
                          color: kTextLight,
                          fontSize: 13.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(55.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.bookmark,
                        color: kAppBar,
                        size: 50.0,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'My Appointment',
                          style: TextStyle(
                            color: kTextColor,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Text(
                        'Appointment History',
                        style: TextStyle(
                          color: kTextLight,
                          fontSize: 13.0,
                        ),
                      ),
                    ],
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

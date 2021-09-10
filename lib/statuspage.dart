import 'package:flutter/material.dart';
import 'package:rwf_hospital_registration/bookappointment.dart';
import 'package:rwf_hospital_registration/myappointment.dart';
import 'constants.dart';

class StatusPage extends StatefulWidget {
  StatusPage({@required this.userid});
  final userid;
  @override
  _StatusPageState createState() => _StatusPageState(userid: userid);
}

class _StatusPageState extends State<StatusPage> {
  _StatusPageState({required this.userid});
  final userid;
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
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.menu),
        // ),
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
                                builder: (context) =>
                                    BookAppointment(userid: userid)),
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return MyAppointment(
                                  userid: userid,
                                );
                              },
                            ),
                          );
                        },
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

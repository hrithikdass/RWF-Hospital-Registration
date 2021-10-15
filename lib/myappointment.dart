import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'constants.dart';

class MyAppointment extends StatelessWidget {
  MyAppointment({required this.userid});
  final userid;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Hospital Registration'),
          backgroundColor: kAppBar,
          actions: [FeedbackMail()],
          // leading: IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.menu),
          // ),
        ),
        body: MainListView(userid: userid),
      ),
    );
  }
}

class Studentdata {
  int id;
  String name;
  var date;
  var time;
  String description;
  String doctorname;

  Studentdata({
    required this.id,
    required this.name,
    this.date,
    this.time,
    required this.description,
    required this.doctorname,
  });

  factory Studentdata.fromJson(Map<String, dynamic> json) {
    return Studentdata(
      id: json['id'],
      name: json['name'],
      date: json['date'],
      time: json['time'],
      description: json['description'],
      doctorname: json['doctorname'],
    );
  }
}

class MainListView extends StatefulWidget {
  MainListView({required this.userid});
  final userid;
  MainListViewState createState() => MainListViewState(userid: userid);
}

class MainListViewState extends State {
  MainListViewState({required this.userid});
  final userid;

  formatDate(String date) {
    DateTime res = DateTime.parse(date);
    return DateFormat('hh:mm aa').format(res).toString();
  }

  Future<void> _showMyDialog(var id) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Please Confirm'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text('Would you like to delete this Appointment?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Confirm'),
              onPressed: () async {
                print('Confirmed');
                var url =
                    'https://blotchiest-exposure.000webhostapp.com/delete_appointment.php';
                await http.post(Uri.parse(url), body: {
                  'id': id.toString(),
                });
                setState(() {});
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  // Future senddata() async {
  //   var url =
  //       "https://blotchiest-exposure.000webhostapp.com/patient_appointmentview.php";
  //   final response = await http.post(Uri.parse(url), body: {
  //     "userid": userid,
  //   });
  //   print(response.body);
  // }

  @override
  void initState() {
    // TODO: implement initState
    runInitFunctions();
    super.initState();
  }

  Future runInitFunctions() async {
    // await senddata();
    await fetchStudents();
  }

  final String apiURL =
      'https://blotchiest-exposure.000webhostapp.com/patient_appointmentview.php';
  Future<List<Studentdata>> fetchStudents() async {
    var url =
        "https://blotchiest-exposure.000webhostapp.com/patient_appointmentview.php";
    final response = await http.post(Uri.parse(url), body: {
      "userid": userid,
    });
    // print(response.body);
    if (response.statusCode == 200) {
      final items = json.decode(response.body).cast<Map<String, dynamic>>();

      List<Studentdata> studentList = items.map<Studentdata>((json) {
        return Studentdata.fromJson(json);
      }).toList();

      return studentList;
    } else {
      throw Exception('Failed to load data from Server.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Studentdata>>(
      future: fetchStudents(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());

        return ListView(
          children: snapshot.data!
              .map((data) => Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: kAppBar)),
                    padding: EdgeInsets.only(bottom: 15.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 35.0,
                              child: TextButton.icon(
                                onPressed: () {
                                  _showMyDialog(data.id);
                                },
                                icon: Icon(Icons.cancel_presentation_outlined),
                                label: Text(''),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            new Text(
                              'Doctor Name',
                              style: TextStyle(
                                color: kTextLight,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                        new Text(
                          data.doctorname,
                          style: TextStyle(
                            color: kTextColor,
                            fontSize: 18.0,
                          ),
                        ),
                        // SizedBox(
                        //   height: 10.0,
                        // ),
                        new Text(
                          'Appointment Date',
                          style: TextStyle(
                            color: kTextLight,
                            fontSize: 18.0,
                          ),
                        ),
                        new Text(
                          data.date,
                          style: TextStyle(
                            color: kTextColor,
                            fontSize: 18.0,
                          ),
                        ),
                        // SizedBox(
                        //   height: 10.0,
                        // ),
                        new Text(
                          'Time',
                          style: TextStyle(
                            color: kTextLight,
                            fontSize: 18.0,
                          ),
                        ),
                        new Text(
                          '${formatDate(data.time)}',
                          style: TextStyle(
                            color: kTextColor,
                            fontSize: 18.0,
                          ),
                        ),
                        new Text(
                          'Description',
                          style: TextStyle(
                            color: kTextLight,
                            fontSize: 18.0,
                          ),
                        ),
                        new Text(
                          data.description,
                          style: TextStyle(
                            color: kTextColor,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                      // children: <Widget>[
                      //   GestureDetector(
                      //     onTap: () {
                      //       navigateToNextActivity(context, data.time);
                      //     },
                      //     child: Row(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Padding(
                      //               padding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                      //               child: Text(data.date + '       ' + data.time,
                      //                   style: TextStyle(fontSize: 21),
                      //                   textAlign: TextAlign.left))
                      //         ]),
                      //   ),
                      //   Divider(color: Colors.black),
                      // ],
                    ),
                  ))
              .toList(),
        );
      },
    );
  }
}

// class SecondScreenState extends StatefulWidget {
//   final userid;
//   SecondScreenState({required this.userid});
//   @override
//   State<StatefulWidget> createState() {
//     return SecondScreen(userid: userid);
//   }
// }
//
// class SecondScreen extends State<SecondScreenState> {
//   final userid;
//
//   SecondScreen({required this.userid});
//
//   // API URL
//   var url =
//       'https://blotchiest-exposure.000webhostapp.com/getdetails_appointment.php';
//
//   Future<List<Studentdata>> fetchStudent() async {
//     var data = {'id': int.parse(userid)};
//
//     var response = await http.post(Uri.parse(url), body: json.encode(data));
//
//     if (response.statusCode == 200) {
//       print(response.statusCode);
//
//       final items = json.decode(response.body).cast<Map<String, dynamic>>();
//
//       List<Studentdata> studentList = items.map<Studentdata>((json) {
//         return Studentdata.fromJson(json);
//       }).toList();
//
//       return studentList;
//     } else {
//       throw Exception('Failed to load data from Server.');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//             appBar: AppBar(
//                 title: Text('Showing Selected Item Details'),
//                 automaticallyImplyLeading: true,
//                 leading: IconButton(
//                   icon: Icon(Icons.arrow_back),
//                   onPressed: () => Navigator.pop(context, false),
//                 )),
//             body: FutureBuilder<List<Studentdata>>(
//               future: fetchStudent(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData)
//                   return Center(child: CircularProgressIndicator());
//
//                 return ListView(
//                   children: snapshot.data!
//                       .map((data) => Column(
//                             children: <Widget>[
//                               GestureDetector(
//                                 onTap: () {
//                                   print(data.date);
//                                 },
//                                 child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Padding(
//                                           padding:
//                                               EdgeInsets.fromLTRB(0, 20, 0, 10),
//                                           child: Text(
//                                               'ID = ' + data.name.toString(),
//                                               style: TextStyle(fontSize: 21))),
//                                       Padding(
//                                           padding:
//                                               EdgeInsets.fromLTRB(0, 0, 0, 10),
//                                           child: Text('Name = ' + data.date,
//                                               style: TextStyle(fontSize: 21))),
//                                       Padding(
//                                           padding:
//                                               EdgeInsets.fromLTRB(0, 0, 0, 10),
//                                           child: Text(
//                                               'Phone Number = ' +
//                                                   data.time.toString(),
//                                               style: TextStyle(fontSize: 21))),
//                                       Padding(
//                                           padding:
//                                               EdgeInsets.fromLTRB(0, 0, 0, 10),
//                                           child: Text(
//                                               'Class = ' + data.description,
//                                               style: TextStyle(fontSize: 21))),
//                                     ]),
//                               )
//                             ],
//                           ))
//                       .toList(),
//                 );
//               },
//             )));
//   }
// }

// import 'package:flutter/material.dart';
// import 'constants.dart';
//
// class MyAppointment extends StatefulWidget {
//   // String docname, date, time, description;
//   MyAppointment({required String userid});
//
//   @override
//   _MyAppointmentState createState() => _MyAppointmentState();
// }
//
// class _MyAppointmentState extends State<MyAppointment> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Hospital Registration'),
//         backgroundColor: kAppBar,
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Icon(Icons.more_vert),
//           )
//         ],
//         leading: IconButton(
//           onPressed: () {},
//           icon: Icon(Icons.menu),
//         ),
//       ),
//       body: ListView.builder(
//         itemCount: 3,
//         itemBuilder: (context, index) {
//           return new Card(
//             child: new Container(
//               decoration:
//                   BoxDecoration(border: Border.all(width: 1.5, color: kAppBar)),
//               padding: EdgeInsets.only(
//                   left: 20.0, right: 20.0, top: 2.0, bottom: 15.0),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       SizedBox(
//                         height: 35.0,
//                         child: TextButton.icon(
//                           onPressed: () {},
//                           icon: Icon(Icons.cancel_presentation_outlined),
//                           label: Text(''),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       new Text(
//                         'Patient Name',
//                         style: TextStyle(
//                           color: kTextLight,
//                           fontSize: 18.0,
//                         ),
//                       ),
//                     ],
//                   ),
//                   new Text(
//                     '',
//                     style: TextStyle(
//                       color: kTextColor,
//                       fontSize: 18.0,
//                     ),
//                   ),
//                   // SizedBox(
//                   //   height: 10.0,
//                   // ),
//                   new Text(
//                     'Appointment Date',
//                     style: TextStyle(
//                       color: kTextLight,
//                       fontSize: 18.0,
//                     ),
//                   ),
//                   new Text(
//                     '',
//                     style: TextStyle(
//                       color: kTextColor,
//                       fontSize: 18.0,
//                     ),
//                   ),
//                   // SizedBox(
//                   //   height: 10.0,
//                   // ),
//                   new Text(
//                     'Time',
//                     style: TextStyle(
//                       color: kTextLight,
//                       fontSize: 18.0,
//                     ),
//                   ),
//                   new Text(
//                     '',
//                     style: TextStyle(
//                       color: kTextColor,
//                       fontSize: 18.0,
//                     ),
//                   ),
//                   new Text(
//                     'Description',
//                     style: TextStyle(
//                       color: kTextLight,
//                       fontSize: 18.0,
//                     ),
//                   ),
//                   new Text(
//                     '',
//                     style: TextStyle(
//                       color: kTextColor,
//                       fontSize: 18.0,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // child: Container(
//             //   decoration:
//             //       BoxDecoration(border: Border.all(width: 1.5, color: kAppBar)),
//             //   padding: EdgeInsets.all(20.0),
//             //   child: Column(
//             //     crossAxisAlignment: CrossAxisAlignment.start,
//             //     children: [
//             //       Row(
//             //         mainAxisAlignment: MainAxisAlignment.end,
//             //         children: [
//             //           TextButton.icon(
//             //               onPressed: () {},
//             //               icon: Icon(Icons.cancel_presentation),
//             //               label: Text(''))
//             //         ],
//             //       ),
//             //       Text('Doctor : ${widget.docname}'),
//             //       Text('Date : ${widget.date}'),
//             //       Text('Time : ${widget.time}'),
//             //       Text('Description : ${widget.description}'),
//             //     ],
//             //   ),
//             // ),
//           );
//           //   new Card(
//           //   child: new Container(
//           //    new Column(
//           //       // crossAxisAlignment: CrossAxisAlignment.start,
//           //       children: [
//           //         Text('Doctor : ${widget.docname}'),
//           //         Text('Date : ${widget.date}'),
//           //         Text('Time : ${widget.time}'),
//           //         Text('Description : ${widget.description}'),
//           //       ],
//           //     ),
//           //   ),
//           // );
//         },
//       ),
//     );
//   }
// }
//
// // class MyAppointment extends StatefulWidget {
// //   String docname, date, time, description;
// //   MyAppointment(
// //       {required this.docname,
// //       required this.date,
// //       required this.time,
// //       required this.description});
// //
// //   @override
// //   _MyAppointmentState createState() => _MyAppointmentState();
// // }
// //
// // class _MyAppointmentState extends State<MyAppointment> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return AppState();
// //   }
// // }
// //
// // class AppState extends StatefulWidget {
// //   @override
// //   _AppStateState createState() => _AppStateState();
// // }
// //
// // class _AppStateState extends State<AppState> {
// //   // List<String> doctors = [
// //   //   doctors.add(doctorname:docname)
// //   //
// //   //
// //   // ];
// //   List doctorname = [
// //     'mahesh',
// //     'suresh',
// //   ];
// //   List appointmentdate = [
// //     '12/03/2000',
// //     '12/03/2001',
// //   ];
// //   List appointmentTime = [
// //     '10:30',
// //     '10:35',
// //   ];
// //   List description = [
// //     'hello this is a dummy description 1',
// //     'hello this is a dummy description 2',
// //   ];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Hospital Registration'),
// //         backgroundColor: kAppBar,
// //         actions: [
// //           IconButton(
// //             onPressed: () {},
// //             icon: Icon(Icons.more_vert),
// //           )
// //         ],
// //         leading: IconButton(
// //           onPressed: () {},
// //           icon: Icon(Icons.menu),
// //         ),
// //       ),
// //       body: new Center(
// //         child: new ListView.builder(
// //           itemBuilder: (_, int index) => EachList(
// //               this.doctorname[index],
// //               this.appointmentdate[index],
// //               this.appointmentTime[index],
// //               this.description[index]),
// //           itemCount: this.doctorname.length,
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class EachList extends StatelessWidget {
// //   final String docname;
// //   final String appointmentdate;
// //   final String appointmentTime;
// //   final String description;
// //   EachList(this.docname, this.appointmentdate, this.appointmentTime,
// //       this.description);
// //   @override
// //   Widget build(BuildContext context) {
// //     return new Card(
// //       child: new Container(
// //         decoration:
// //             BoxDecoration(border: Border.all(width: 1.5, color: kAppBar)),
// //         padding:
// //             EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0, bottom: 15.0),
// //         child: Column(
// //           children: [
// //             new Text(
// //               'Doctor Name',
// //               style: TextStyle(
// //                 color: kTextLight,
// //                 fontSize: 18.0,
// //               ),
// //             ),
// //             new Text(
// //               docname,
// //               style: TextStyle(
// //                 color: kTextColor,
// //                 fontSize: 18.0,
// //               ),
// //             ),
// //             SizedBox(
// //               height: 10.0,
// //             ),
// //             new Text(
// //               'Appointment Date',
// //               style: TextStyle(
// //                 color: kTextLight,
// //                 fontSize: 18.0,
// //               ),
// //             ),
// //             new Text(
// //               appointmentdate,
// //               style: TextStyle(
// //                 color: kTextColor,
// //                 fontSize: 18.0,
// //               ),
// //             ),
// //             SizedBox(
// //               height: 10.0,
// //             ),
// //             new Text(
// //               'Time',
// //               style: TextStyle(
// //                 color: kTextLight,
// //                 fontSize: 18.0,
// //               ),
// //             ),
// //             new Text(
// //               appointmentTime,
// //               style: TextStyle(
// //                 color: kTextColor,
// //                 fontSize: 18.0,
// //               ),
// //             ),
// //             SizedBox(
// //               height: 10.0,
// //             ),
// //             new Text(
// //               'Description',
// //               style: TextStyle(
// //                 color: kTextLight,
// //                 fontSize: 18.0,
// //               ),
// //             ),
// //             new Text(
// //               description,
// //               style: TextStyle(
// //                 color: kTextColor,
// //                 fontSize: 18.0,
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

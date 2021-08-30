import 'package:flutter/material.dart';
import 'constants.dart';

class MyAppointment extends StatefulWidget {
  String docname, date, time, description;
  MyAppointment(
      {required this.docname,
      required this.date,
      required this.time,
      required this.description});

  @override
  _MyAppointmentState createState() => _MyAppointmentState();
}

class _MyAppointmentState extends State<MyAppointment> {
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
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return new Card(
            child: new Container(
              decoration:
                  BoxDecoration(border: Border.all(width: 1.5, color: kAppBar)),
              padding: EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 2.0, bottom: 15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 35.0,
                        child: TextButton.icon(
                          onPressed: () {},
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
                        'Patient Name',
                        style: TextStyle(
                          color: kTextLight,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                  new Text(
                    '${widget.docname}',
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
                    '${widget.date}',
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
                    '${widget.time}',
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
                    '${widget.description}',
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
            // child: Container(
            //   decoration:
            //       BoxDecoration(border: Border.all(width: 1.5, color: kAppBar)),
            //   padding: EdgeInsets.all(20.0),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.end,
            //         children: [
            //           TextButton.icon(
            //               onPressed: () {},
            //               icon: Icon(Icons.cancel_presentation),
            //               label: Text(''))
            //         ],
            //       ),
            //       Text('Doctor : ${widget.docname}'),
            //       Text('Date : ${widget.date}'),
            //       Text('Time : ${widget.time}'),
            //       Text('Description : ${widget.description}'),
            //     ],
            //   ),
            // ),
          );
          //   new Card(
          //   child: new Container(
          //    new Column(
          //       // crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text('Doctor : ${widget.docname}'),
          //         Text('Date : ${widget.date}'),
          //         Text('Time : ${widget.time}'),
          //         Text('Description : ${widget.description}'),
          //       ],
          //     ),
          //   ),
          // );
        },
      ),
    );
  }
}

// class MyAppointment extends StatefulWidget {
//   String docname, date, time, description;
//   MyAppointment(
//       {required this.docname,
//       required this.date,
//       required this.time,
//       required this.description});
//
//   @override
//   _MyAppointmentState createState() => _MyAppointmentState();
// }
//
// class _MyAppointmentState extends State<MyAppointment> {
//   @override
//   Widget build(BuildContext context) {
//     return AppState();
//   }
// }
//
// class AppState extends StatefulWidget {
//   @override
//   _AppStateState createState() => _AppStateState();
// }
//
// class _AppStateState extends State<AppState> {
//   // List<String> doctors = [
//   //   doctors.add(doctorname:docname)
//   //
//   //
//   // ];
//   List doctorname = [
//     'mahesh',
//     'suresh',
//   ];
//   List appointmentdate = [
//     '12/03/2000',
//     '12/03/2001',
//   ];
//   List appointmentTime = [
//     '10:30',
//     '10:35',
//   ];
//   List description = [
//     'hello this is a dummy description 1',
//     'hello this is a dummy description 2',
//   ];
//
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
//       body: new Center(
//         child: new ListView.builder(
//           itemBuilder: (_, int index) => EachList(
//               this.doctorname[index],
//               this.appointmentdate[index],
//               this.appointmentTime[index],
//               this.description[index]),
//           itemCount: this.doctorname.length,
//         ),
//       ),
//     );
//   }
// }
//
// class EachList extends StatelessWidget {
//   final String docname;
//   final String appointmentdate;
//   final String appointmentTime;
//   final String description;
//   EachList(this.docname, this.appointmentdate, this.appointmentTime,
//       this.description);
//   @override
//   Widget build(BuildContext context) {
//     return new Card(
//       child: new Container(
//         decoration:
//             BoxDecoration(border: Border.all(width: 1.5, color: kAppBar)),
//         padding:
//             EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0, bottom: 15.0),
//         child: Column(
//           children: [
//             new Text(
//               'Doctor Name',
//               style: TextStyle(
//                 color: kTextLight,
//                 fontSize: 18.0,
//               ),
//             ),
//             new Text(
//               docname,
//               style: TextStyle(
//                 color: kTextColor,
//                 fontSize: 18.0,
//               ),
//             ),
//             SizedBox(
//               height: 10.0,
//             ),
//             new Text(
//               'Appointment Date',
//               style: TextStyle(
//                 color: kTextLight,
//                 fontSize: 18.0,
//               ),
//             ),
//             new Text(
//               appointmentdate,
//               style: TextStyle(
//                 color: kTextColor,
//                 fontSize: 18.0,
//               ),
//             ),
//             SizedBox(
//               height: 10.0,
//             ),
//             new Text(
//               'Time',
//               style: TextStyle(
//                 color: kTextLight,
//                 fontSize: 18.0,
//               ),
//             ),
//             new Text(
//               appointmentTime,
//               style: TextStyle(
//                 color: kTextColor,
//                 fontSize: 18.0,
//               ),
//             ),
//             SizedBox(
//               height: 10.0,
//             ),
//             new Text(
//               'Description',
//               style: TextStyle(
//                 color: kTextLight,
//                 fontSize: 18.0,
//               ),
//             ),
//             new Text(
//               description,
//               style: TextStyle(
//                 color: kTextColor,
//                 fontSize: 18.0,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

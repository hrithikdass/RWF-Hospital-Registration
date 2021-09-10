import 'package:flutter/material.dart';
import 'package:rwf_hospital_registration/docviewappointment.dart';
import 'constants.dart';

class WelcomeDoctor extends StatelessWidget {
  WelcomeDoctor({required this.duserid});
  final duserid;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
        body: ViewAppointment(
          duserid: duserid,
        ),
      ),
    );
  }
}

class ViewAppointment extends StatefulWidget {
  ViewAppointment({@required this.duserid});
  final duserid;

  @override
  _ViewAppointmentState createState() =>
      _ViewAppointmentState(duserid: duserid);
}

class _ViewAppointmentState extends State<ViewAppointment> {
  _ViewAppointmentState({required this.duserid});
  final duserid;
  // @override
  // void initState() {
  //   fetchUserData();
  //   super.initState();
  // }
  //
  // fetchUserData() async {
  //   //TODO write fetching user data func
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            Column(
              children: [
                Text(
                  "Welcome!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    color: kTextColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                          builder: (context) => DocViewAppointment(
                                duserid: duserid,
                              )),
                    );
                  },
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
    );
  }
}

// class WelcomeDoctor extends StatefulWidget {
//   const WelcomeDoctor({Key? key, required String userid}) : super(key: key);
//
//   @override
//   _WelcomeDoctorState createState() => _WelcomeDoctorState();
// }
//
// class _WelcomeDoctorState extends State<WelcomeDoctor> {
//   var docname = "Default";
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
//       body: SingleChildScrollView(
//         child: Container(
//           margin: EdgeInsets.all(35.0),
//           child: Center(
//             child: Column(
//               children: [
//                 Container(
//                   margin: EdgeInsets.all(20.0),
//                   child: Column(
//                     children: [
//                       Text(
//                         "Welcome!",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 30.0,
//                           color: kTextColor,
//                         ),
//                       ),
//                       Text(
//                         docname,
//                         style: TextStyle(
//                           color: kTextColor,
//                           fontSize: 20.0,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 100.0,
//                 ),
//                 Column(
//                   children: [
//                     Icon(
//                       Icons.bookmark,
//                       color: kAppBar,
//                       size: 50.0,
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) {
//                               return MyApp();
//                               // DocViewAppointment();
//                             },
//                           ),
//                         );
//                       },
//                       child: Text(
//                         'Appointments',
//                         style: TextStyle(
//                           color: kTextColor,
//                           fontSize: 30.0,
//                         ),
//                       ),
//                     ),
//                     Text(
//                       'Patient Appointment',
//                       style: TextStyle(
//                         color: kTextLight,
//                         fontSize: 15.0,
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

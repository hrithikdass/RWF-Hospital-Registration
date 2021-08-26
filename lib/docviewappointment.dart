import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class DocViewAppointment extends StatefulWidget {
  const DocViewAppointment({Key? key}) : super(key: key);

  @override
  _DocViewAppointmentState createState() => _DocViewAppointmentState();
}

class _DocViewAppointmentState extends State<DocViewAppointment> {
  @override
  Widget build(BuildContext context) {
    return AppState();
  }
}

class AppState extends StatefulWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  _AppStateState createState() => _AppStateState();
}

class _AppStateState extends State<AppState> {
  List doctorname = [
    'mahesh',
    'suresh',
    'ram',
    'mohan',
    'rohan',
    'gagan',
    'sailesh',
  ];
  List appointmentdate = [
    '12/03/2000',
    '12/03/2001',
    '12/03/2002',
    '12/03/2003',
    '12/03/2004',
    '12/03/2005',
    '12/03/2006',
  ];
  List appointmentTime = [
    '10:30',
    '10:35',
    '10:40',
    '10:45',
    '10:45',
    '10:50',
    '10:55',
  ];
  List description = [
    'hello this is a dummy description 1',
    'hello this is a dummy description 2',
    'hello this is a dummy description 3',
    'hello this is a dummy description 4',
    'hello this is a dummy description 5',
    'hello this is a dummy description 6',
    'hello this is a dummy description 7',
  ];

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
      body: new Center(
        child: new ListView.builder(
          itemBuilder: (_, int index) => EachList(
              this.doctorname[index],
              this.appointmentdate[index],
              this.appointmentTime[index],
              this.description[index]),
          itemCount: this.doctorname.length,
        ),
      ),
    );
  }
}

class EachList extends StatelessWidget {
  final String patientname;
  final String appointmentdate;
  final String appointmentTime;
  final String description;
  EachList(this.patientname, this.appointmentdate, this.appointmentTime,
      this.description);
  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Container(
        decoration:
            BoxDecoration(border: Border.all(width: 1.5, color: kAppBar)),
        padding:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0, bottom: 15.0),
        child: Column(
          children: [
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
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.cancel_presentation_outlined),
                  label: Text(''),
                ),
              ],
            ),
            new Text(
              patientname,
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
              appointmentdate,
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
              appointmentTime,
              style: TextStyle(
                color: kTextColor,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

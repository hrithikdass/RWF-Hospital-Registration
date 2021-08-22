import 'package:alert/alert.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:rwf_hospital_registration/main.dart';
import 'package:rwf_hospital_registration/myappointment.dart';
import 'constants.dart';

class BookAppointment extends StatefulWidget {
  const BookAppointment({Key? key}) : super(key: key);

  @override
  _BookAppointmentState createState() => _BookAppointmentState();
}

final _rkey = GlobalKey<FormState>();
String _docname = '';
String _bookdate = '';
String _booktime = '';
String _bookdescription = '';

class _BookAppointmentState extends State<BookAppointment> {
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
          padding: EdgeInsets.all(10.0),
          child: Form(
            key: _rkey,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        'Doctor',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      DropDownField(
                        controller: citiesSelected,
                        hintText: "Select the Doctor",
                        enabled: true,
                        itemsVisibleInDropdown: 5,
                        items: cities,
                        onValueChanged: (value) {
                          _docname = value;
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      DateTimePicker(
                        initialValue: DateTime.now().toString(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(new Duration(days: 2)),
                        dateLabelText: 'Date',
                        // selectableDayPredicate: (date) {
                        //   // Disable weekend days to select from the calendar
                        //   if (date.weekday == 6 || date.weekday == 7) {
                        //     return false;
                        //   }
                        //
                        //   return true;
                        // },
                        onChanged: (_bookdate) => print(_bookdate),
                        validator: (_bookdate) {
                          print(_bookdate);
                          return null;
                        },
                        onSaved: (val) => print(val),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      DateTimePicker(
                        type: DateTimePickerType.time,
                        use24HourFormat: true,
                        timeLabelText: 'Time',
                        onChanged: (val) => print(val),
                        validator: (val) {
                          print(val);
                          return null;
                        },
                        onSaved: (val) => print(val),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        'Description',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 18.0,
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Simple Description',
                        ),
                        maxLines: 3,
                        maxLength: 30,
                        obscureText: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Description is required";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) async {
                          _bookdescription = value.toString();
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: SizedBox(
                    height: 50.0,
                    width: 140.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: kButtonColor, // background
                        onPrimary: Colors.black, // foreground
                      ),
                      onPressed: () {
                        if (_rkey.currentState!.validate()) {
                          print('data is submitted');
                          // showDialog(
                          //     context: context,
                          //     builder: (context) {
                          //       return Text('hello');
                          //     });
                          print(_docname);

                          print(_bookdate);
                          print(_booktime);
                          print(_bookdescription);
                          Alert(
                            message: 'Booked',
                          ).show();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return MyAppointment();
                              },
                            ),
                          );
                          _rkey.currentState!.save();
                        }
                      },
                      child: Text("BOOK"),
                    ),
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

final citiesSelected = TextEditingController();

List<String> cities = [
  "bangalore",
  "mumbai",
  "chennai",
  "calcotta",
  "hyderbad",
  "tiptur",
  "pondycherry",
  "ooty",
];

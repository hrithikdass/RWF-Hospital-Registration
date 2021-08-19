import 'package:date_time_picker/date_time_picker.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class BookAppointment extends StatefulWidget {
  const BookAppointment({Key? key}) : super(key: key);

  @override
  _BookAppointmentState createState() => _BookAppointmentState();
}

final _rkey = GlobalKey<FormState>();
String _bookusername = '';
String _bookdescription = '';
bool securetext = true;
String _regphonenum = '';

class _BookAppointmentState extends State<BookAppointment> {
  // DateTime pickedDate;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   pickedDate = DateTime.now();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital Management'),
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
                          selectCities = value;
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
                        type: DateTimePickerType.date,
                        dateMask: 'd MMM, yyyy',
                        initialValue: DateTime.now().toString(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                        icon: Icon(Icons.event),
                        dateLabelText: 'Date',
                        selectableDayPredicate: (date) {
                          // Disable weekend days to select from the calendar
                          if (date.weekday == 6 || date.weekday == 7) {
                            return false;
                          }

                          return true;
                        },
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
                        }
                        _rkey.currentState!.save();
                        print(_bookusername);
                        print(_regphonenum);
                        print(_bookdescription);
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

String selectCities = "";

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

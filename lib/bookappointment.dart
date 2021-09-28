import 'dart:convert';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rwf_hospital_registration/models/doctor_response_model.dart';
import 'constants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class BookAppointment extends StatelessWidget {
  BookAppointment({required this.userid});
  final userid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
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
        body: Center(
            child: Booking(
          userid: userid,
        )));
  }
}

String name = '';
var duserid;
List results = [];
String doctorname = '';
var time;

class Booking extends StatefulWidget {
  Booking({required this.userid});
  final userid;
  @override
  _BookingState createState() => _BookingState(userid: userid);
}

class _BookingState extends State {
  _BookingState({required this.userid});
  final userid;
  final _rkey = GlobalKey<FormState>();
  String message = '';
  bool error = false;
  DoctorResponseModel data = DoctorResponseModel();
  Map<String?, dynamic> doctorMap = {};
  Data? selectedDoctor = Data();
  var isLoading = true;

  Future getdoctornames() async {
    // SERVER API URL
    var url =
        'https://blotchiest-exposure.000webhostapp.com/booking/get_doctornames.php';
    // Starting Web API Call.
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      setState(() {
        var encodeData = jsonDecode(res.body);
        data = DoctorResponseModel.fromJson(encodeData);
        if (data.errmsg!.isEmpty) {
          //check fi there is any error from server.
          error = true;
          message = data.errmsg!;
        }
      });
    } else {
      //there is error
      setState(() {
        error = true;
        message = "Error during fetching data";
      });
    }
    // Getting Server response into variable.
    // var message = jsonDecode(response.body);
    // results = message[1 - 10]["doctorname"];
    // print(results);
  }

  Future getUserName() async {
    // SERVER API URL
    var url =
        'https://blotchiest-exposure.000webhostapp.com/booking/get_patientname.php';
    print(userid);
    // Starting Web API Call.
    var response = await http.post(Uri.parse(url), body: {
      'userid': userid,
    });

    // Getting Server response into variable.
    var message = jsonDecode(response.body);
    name = message[0]["name"];
    print(name);
  }

  // Boolean variable for CircularProgressIndicator.
  bool visible = false;
  bool securetext = true;
  String doctorname = '';

  // Getting value from TextField widget.
  final descriptionController = TextEditingController();
  final datecontroller = TextEditingController();
  final timecontroller = TextEditingController();

  Future userRegistration() async {
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    // Getting value from Controller
    String description = descriptionController.text;
    String date = datecontroller.text;
    // String time = timecontroller.text;
    // String time = '';

    // SERVER API URL
    var url =
        'https://blotchiest-exposure.000webhostapp.com/booking/book_appointment.php';

    // Store all data with Param Name.
    var data = {
      'userid': userid,
      'name': name,
      'date': date,
      'time': formatFinalDate(time.toString()),
      'description': description,
      'duserid': selectedDoctor!.duserid,
      'doctorname': selectedDoctor!.doctorname,
    };

    print(data);

    // Starting Web API Call.
    var response = await http.post(Uri.parse(url), body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });
    }

    // Showing Alert Dialog with Response JSON Message.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            ElevatedButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    getDoctorDetails();
    setState(() {
      isLoading = false;
    });
    super.initState();
  }

  getDoctorDetails() async {
    await getdoctornames();
    selectedDoctor = data.data!.first;
    await getUserName();
  }

  formatDate(String date) {
    DateTime res = DateTime.parse(date);
    return DateFormat('hh:mm aa').format(res).toString();
  }

  formatFinalDate(String date) {
    DateTime res = DateTime.parse(date);
    return DateFormat('yyyy-MM-dd HH:mm').format(res).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Container(
                padding: EdgeInsets.all(15.0),
                child: Center(
                  child: Form(
                    key: _rkey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 280,
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Text(
                                'Doctor',
                                style: TextStyle(
                                  color: kTextColor,
                                  fontSize: 18.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropdownButtonFormField<Data?>(
                                  value: selectedDoctor,
                                  items: data.data?.map((e) {
                                        return DropdownMenuItem(
                                            value: e,
                                            child: Text('${e.doctorname}'));
                                      }).toList() ??
                                      [],
                                  onChanged: (Data? item) {
                                    setState(() {
                                      selectedDoctor = item;
                                    });
                                    print(item.runtimeType);
                                  },
                                  hint: Text('Select Doctor'),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              DateTimePicker(
                                controller: datecontroller,
                                type: DateTimePickerType.date,
                                dateMask: 'd MMM, yyyy',
                                initialValue: null,
                                firstDate: DateTime.now(),
                                lastDate:
                                    DateTime.now().add(new Duration(days: 2)),
                                dateLabelText: 'Date',
                                // selectableDayPredicate: (date) {
                                //   // Disable weekend days to select from the calendar
                                //   if (date.weekday == 6 || date.weekday == 7) {
                                //     return false;
                                //   }
                                //
                                //   return true;
                                // },

                                icon: Icon(Icons.event),

                                // onChanged: (val) => print(val),
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Date cannot be empty";
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (value) async {
                                  print(datecontroller);
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          width: 280.0,
                          margin: EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              GestureDetector(
                                  onTap: () async {
                                    showModalBottomSheet(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(15))),
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                2.3,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.white),
                                            child: Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                children: [
                                                  Text('Select Time',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  TimePickerSpinner(
                                                    is24HourMode: false,
                                                    minutesInterval: 5,
                                                    normalTextStyle: TextStyle(
                                                        fontSize: 24,
                                                        color: kTextColor),
                                                    highlightedTextStyle:
                                                        TextStyle(
                                                            fontSize: 24,
                                                            color: kAppBar),
                                                    spacing: 50,
                                                    itemHeight: 80,
                                                    isForce2Digits: true,
                                                    onTimeChange: (timee) {
                                                      setState(() {
                                                        time = timee;
                                                        print(timee);
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 20,
                                          width: double.infinity,
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.timer,
                                                color: Colors.grey.shade600,
                                              ),
                                              SizedBox(width: 10),
                                              time != null
                                                  ? Text(
                                                      '${formatDate(time.toString())}')
                                                  : Text(
                                                      'Please select a time'),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Divider(
                                          color: Colors.black,
                                          thickness: 0.6,
                                        )
                                      ],
                                    ),
                                  )),
                              // DateTimePicker(
                              //   controller: timecontroller,
                              //   // dateMask: 'd,mmm,yyyy',
                              //   timePickerEntryModeInput: false,
                              //   type: DateTimePickerType.time,
                              //   use24HourFormat: true,
                              //   timeLabelText: 'Time',
                              //
                              //   timeHintText: 'Select Time in intervals of 5',
                              //   onChanged: (val) => print(val),
                              //   validator: (val) {
                              //     if (val!.isEmpty) {
                              //       return "Time cannot be empty";
                              //     } else {
                              //       return null;
                              //     }
                              //   },
                              //   onSaved: (value) async {
                              //     print(timecontroller);
                              //   },
                              // ),
                            ],
                          ),
                        ),
                        Container(
                            width: 280,
                            padding: EdgeInsets.all(10.0),
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
                                  maxLength: 30,
                                  maxLines: 3,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Name cannot be empty";
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: descriptionController,
                                  autocorrect: true,
                                  // decoration:
                                  //     InputDecoration(hintText: 'Enter Your Name Here'),
                                ),
                              ],
                            )),

                        SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          height: 50.0,
                          width: 120.0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: kButtonColor, // background
                              onPrimary: Colors.black, // foreground
                            ),
                            onPressed: () {
                              if (_rkey.currentState!.validate()) {
                                userRegistration();
                              }
                            },
                            // userRegistration,
                            child: Text('BOOK'),
                          ),
                        ),
                        // RaisedButton(
                        //   onPressed: userRegistration,
                        //   color: Colors.green,
                        //   textColor: Colors.white,
                        //   padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        //   child: Text('Register'),
                        // ),
                        Visibility(
                          visible: visible,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 30),
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )));
  }
}

// return Scaffold(
//     body: SingleChildScrollView(
//         child: Center(
//   child: Form(
//     key: _dkey,
//     child: Column(
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.all(25.0),
//         ),
//
//         Container(
//           width: 280,
//           padding: EdgeInsets.all(10.0),
//           child: Column(
//             children: [
//               Text(
//                 'DOCTOR',
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                   color: kTextColor,
//                   fontSize: 18.0,
//                 ),
//               ),
//               DropdownButton(
//                 value: selectedName,
//                 hint: Text("select Doctor"),
//                 items: data.map(
//                   (list) {
//                     return DropdownMenuItem(
//                       child: Text(list["doctorname"]),
//                       value: list['doctorname'],
//                     );
//                   },
//                 ).toList(),
//                 onChanged: (val) {
//                   setState(() {
//                     selectedName = '';
//                   });
//                 },
//               ),
//               // TextFormField(
//               //   controller: useridController,
//               //   autocorrect: true,
//               //   // decoration:
//               //   //     InputDecoration(hintText: 'Enter Your User ID Here'),
//               //   validator: (value) {
//               //     if (value!.isEmpty) {
//               //       return "User ID cannot be empty";
//               //     } else {
//               //       return null;
//               //     }
//               //   },
//               // ),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: 20.0,
//         ),
//
//         // Container(
//         //   width: 280,
//         //   padding: EdgeInsets.all(10.0),
//         //   child: Column(
//         //     children: [
//         //       Text(
//         //         'Password',
//         //         textAlign: TextAlign.left,
//         //         style: TextStyle(
//         //           color: kTextColor,
//         //           fontSize: 18.0,
//         //         ),
//         //       ),
//         //       TextFormField(
//         //         controller: passwordController,
//         //         autocorrect: true,
//         //         obscureText: securetext,
//         //         decoration: InputDecoration(
//         //           suffixIcon: IconButton(
//         //             icon: Icon(securetext
//         //                 ? Icons.visibility_off
//         //                 : Icons.visibility),
//         //             onPressed: () {
//         //               setState(() {
//         //                 securetext = !securetext;
//         //               });
//         //             },
//         //           ),
//         //         ),
//         //         validator: (value) {
//         //           if (value!.isEmpty) {
//         //             return "Password is required";
//         //           } else {
//         //             return null;
//         //           }
//         //         },
//         //       ),
//         //     ],
//         //   ),
//         // ),
//         // SizedBox(
//         //   height: 20.0,
//         // ),
//         // SizedBox(
//         //   height: 50.0,
//         //   width: 140.0,
//         //   child: ElevatedButton(
//         //     style: ElevatedButton.styleFrom(
//         //       primary: kButtonColor, // background
//         //       onPrimary: Colors.black, // foreground
//         //     ),
//         //     onPressed: () {
//         //       if (_dkey.currentState!.validate()) {
//         //         // userLogin();
//         //       }
//         //     },
//         //     // userLogin,
//         //     child: Text('LOGIN'),
//         //   ),
//         // ),
//         // RaisedButton(
//         //   onPressed: userLogin,
//         //   color: kButtonColor,
//         //   textColor: Colors.white,
//         //   padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
//         //   child: Text('LOGIN'),
//         // ),
//         // Visibility(
//         //   visible: visible,
//         //   child: Container(
//         //     margin: EdgeInsets.only(bottom: 30),
//         //     child: CircularProgressIndicator(),
//         //   ),
//         // ),
//       ],
//     ),
//   ),
// )));

// class Booking extends StatefulWidget {
//   Booking({required this.userid});
//   final userid;
//
//   @override
//   _BookingState createState() => _BookingState(userid: userid);
// }
//
// // final _rkey = GlobalKey<FormState>();
// // String _docname = '';
// // String _bookdate = '';
// // String _booktime = '';
// // String _bookdescription = '';
// // // TextEditingController _bookdate = new TextEditingController();
//
// class _BookingState extends State<Booking> {
//   _BookingState({required this.userid});
//   final userid;
//
//   // String selectedName = '';
//   //
//   // List data = List();
//   //
//   // Future getAllName() async {
//   //   var url = "https://blotchiest-exposure.000webhostapp.com/view_doctors.php";
//   //   // var response =
//   //   //     await http.get(Uri.parse(url), header: {"Accept": "application/json"});
//   //   var response = await http.post(Uri.parse(url), body: json.encode(data));
//   //   var jsonBody = response.body;
//   //   var jsonData = json.decode(jsonBody);
//   //
//   //   //   setState(() {
//   //   //     data = jsonData;
//   //   //   });
//   //   //   print(jsonData);
//   //   //   return "sucess";
//   //   // }
//   //   //
//   //   // @override
//   //   // Void initState() {
//   //   //   super.initState();
//   //   //   getAllName();
//   //   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.all(10.0),
//           child: Form(
//             key: _rkey,
//             child: Column(
//               children: <Widget>[
//                 Container(
//                   margin: EdgeInsets.all(15.0),
//                   child: Column(
//                     children: [
//                       Text(
//                         'Doctor',
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                           color: kTextColor,
//                           fontSize: 18.0,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20.0,
//                       ),
//                       // DropdownButton(
//                       //   value: selectedName,
//                       //   hint: Text('Select Doctor'),
//                       //   items: data.map(
//                       //     (list) {
//                       //       return DropdownMenuItem(
//                       //         child: Text(list['doctorname']),
//                       //         value: list['duserid'].toString(),
//                       //       );
//                       //     },
//                       //   ).toList(),
//                       //   onChanged: (value) {
//                       //     setState(() {
//                       //       selectedName = value.toString();
//                       //     });
//                       //   },
//                       // ),
//                       DropDownField(
//                         controller: citiesSelected,
//                         hintText: "Select the Doctor",
//                         enabled: true,
//                         itemsVisibleInDropdown: 5,
//                         items: cities,
//                         onValueChanged: (value) {
//                           _docname = value;
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(15.0),
//                   child: Column(
//                     children: [
//                       DateTimePicker(
//                         initialValue: DateTime.now().toString(),
//                         firstDate: DateTime.now(),
//                         lastDate: DateTime.now().add(new Duration(days: 2)),
//                         dateLabelText: 'Date',
//                         selectableDayPredicate: (date) {
//                           // Disable weekend days to select from the calendar
//                           if (date.weekday == 6 || date.weekday == 7) {
//                             return false;
//                           }
//
//                           return true;
//                         },
//                         onChanged: (_bookdate) => print(_bookdate),
//                         validator: (_bookdate) {
//                           print(_bookdate);
//                           return null;
//                         },
//                         onSaved: (value) async {
//                           _bookdate = value.toString();
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(15.0),
//                   child: Column(
//                     children: [
//                       DateTimePicker(
//                         dateMask: 'd,mmm,yyyy',
//                         type: DateTimePickerType.time,
//                         use24HourFormat: true,
//                         timeLabelText: 'Time',
//                         onChanged: (val) => print(val),
//                         validator: (val) {
//                           print(val);
//                           return null;
//                         },
//                         onSaved: (value) async {
//                           _booktime = value.toString();
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(15.0),
//                   child: Column(
//                     children: [
//                       Text(
//                         'Description',
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                           color: kTextColor,
//                           fontSize: 18.0,
//                         ),
//                       ),
//                       TextFormField(
//                         decoration: InputDecoration(
//                           hintText: 'Simple Description',
//                         ),
//                         maxLines: 3,
//                         maxLength: 30,
//                         obscureText: false,
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return "Description is required";
//                           } else {
//                             return null;
//                           }
//                         },
//                         onSaved: (value) async {
//                           _bookdescription = value.toString();
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(15.0),
//                   child: SizedBox(
//                     height: 50.0,
//                     width: 140.0,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         primary: kButtonColor, // background
//                         onPrimary: Colors.black, // foreground
//                       ),
//                       onPressed: () {
//                         if (_rkey.currentState!.validate()) {
//                           print('data is submitted');
//                           print(_docname);
//
//                           print(_bookdate);
//                           print(_booktime);
//                           print(_bookdescription);
//                           Alert(
//                             message: 'Booked',
//                           ).show();
//                           // Navigator.push(
//                           //   context,
//                           //   MaterialPageRoute(
//                           //     builder: (context) {
//                           //       return MyAppointment(
//                           //         date: _bookdate,
//                           //         description: _bookdescription,
//                           //         docname: _docname,
//                           //         time: _booktime,
//                           //       );
//                           //     },
//                           //   ),
//                           // );
//                           Navigator.of(context).push(
//                             MaterialPageRoute(
//                               builder: (context) =>
//                                   MyAppointment(userid: '${widget.userid}'),
//                             ),
//                           );
//                           _rkey.currentState!.save();
//                         }
//                       },
//                       child: Text("BOOK"),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// final citiesSelected = TextEditingController();
//
// List<String> cities = [
//   "bangalore",
//   "mumbai",
//   "chennai",
//   "calcotta",
//   "hyderbad",
//   "tiptur",
//   "pondycherry",
//   "ooty",
// ];

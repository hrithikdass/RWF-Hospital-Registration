import 'dart:convert';
import 'dart:ui';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rwf_hospital_registration/patientloginpage.dart';
import 'constants.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(RegisterApp());

class RegisterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text('User Registration Form'),
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
            body: Center(child: RegisterUser())));
  }
}

class RegisterUser extends StatefulWidget {
  RegisterUserState createState() => RegisterUserState();
}

class RegisterUserState extends State {
  // Boolean variable for CircularProgressIndicator.
  bool visible = false;
  bool securetext = true;

  // Getting value from TextField widget.
  final useridController = TextEditingController();
  final nameController = TextEditingController();
  final dobcontroller = TextEditingController();
  final phonenumbercontroller = TextEditingController();
  final passwordController = TextEditingController();

  Future userRegistration() async {
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    // Getting value from Controller
    String userid = useridController.text;
    String name = nameController.text;
    String dob = dobcontroller.text;
    String phonenumber = phonenumbercontroller.text;
    String password = passwordController.text;

    // SERVER API URL
    var url = 'https://blotchiest-exposure.000webhostapp.com/register_user.php';

    // Store all data with Param Name.
    var data = {
      'userid': userid,
      'dob': dob,
      'name': name,
      'password': password,
      'phonenumber': phonenumber,
    };

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
            FlatButton(
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
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      padding: EdgeInsets.all(15.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
                width: 280,
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      'User ID',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: kTextColor,
                        fontSize: 18.0,
                      ),
                    ),
                    TextField(
                      controller: useridController,
                      autocorrect: true,
                      decoration:
                          InputDecoration(hintText: 'Enter Your User ID Here'),
                    ),
                  ],
                )),
            Container(
                width: 280,
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      'Name',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: kTextColor,
                        fontSize: 18.0,
                      ),
                    ),
                    TextField(
                      controller: nameController,
                      autocorrect: true,
                      decoration:
                          InputDecoration(hintText: 'Enter Your Name Here'),
                    ),
                  ],
                )),
            Container(
              width: 280,
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    'DOB',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 18.0,
                    ),
                  ),
                  DateTimePicker(
                    controller: dobcontroller,
                    type: DateTimePickerType.date,
                    dateMask: 'd MMM, yyyy',
                    initialValue: null,
                    firstDate: DateTime(1950),
                    lastDate: DateTime.now(),
                    icon: Icon(Icons.event),
                    dateLabelText: 'Date',
                    // onChanged: (val) => print(val),
                    validator: (val) {
                      print(val);
                      return null;
                    },
                    onSaved: (value) async {
                      print(dobcontroller);
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: 280,
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    'Phone Number',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 18.0,
                    ),
                  ),
                  TextFormField(
                    controller: phonenumbercontroller,
                    validator: (value) {
                      print(value);
                      if (value!.isEmpty) {
                        return "Enter Phone Number";
                      } else if (value.length != 10) {
                        return "Enter correct number";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (val) => print(val),
                    decoration: InputDecoration(prefixText: '+91'),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
            Container(
              width: 280,
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    'Password',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 18.0,
                    ),
                  ),
                  TextField(
                    controller: passwordController,
                    autocorrect: true,
                    obscureText: securetext,
                    decoration:
                        // InputDecoration(hintText: 'Enter Your Password Here'),
                        InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(securetext
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            securetext = !securetext;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
                onPressed: userRegistration,
                child: Text('REGISTER'),
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
    )));
  }
}

//
//

// class RegisterPage extends StatefulWidget {
//   const RegisterPage({Key? key}) : super(key: key);
//
//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }
//
// final _rkey = GlobalKey<FormState>();
// String userid = '';
// var dob;
// String password = '';
// bool securetext = true;
// var phonenumber;
//
// class _RegisterPageState extends State<RegisterPage> {
//   void registerUser() async {
//     var url = 'https://blotchiest-exposure.000webhostapp.com/signup.php';
//     var data = {
//       "userid": userid,
//       "dob": dob,
//       "phonenumber": phonenumber,
//       "password": password,
//     };
//
//     var res = await http.post(Uri.parse(url), body: data);
//
//     if (jsonDecode(res.body) == "account already exists") {
//       Fluttertoast.showToast(
//           msg: "account exists, please login", toastLength: Toast.LENGTH_SHORT);
//     } else {
//       if (jsonDecode(res.body) == "true") {
//         Fluttertoast.showToast(
//             msg: "account created", toastLength: Toast.LENGTH_SHORT);
//       } else {
//         Fluttertoast.showToast(msg: "error", toastLength: Toast.LENGTH_SHORT);
//       }
//     }
//   }
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
//                         'User ID',
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                           color: kTextColor,
//                           fontSize: 18.0,
//                         ),
//                       ),
//                       TextFormField(
//                         // validator: (value) {
//                         //   if (value!.isEmpty) {
//                         //     return "User ID cannot be empty";
//                         //   } else if (value.length <= 5) {
//                         //     return "User ID show be greater than 5";
//                         //   } else {
//                         //     return null;
//                         //   }
//                         // },
//                         onSaved: (value) async {
//                           userid = value.toString();
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
//                         'DOB',
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                           color: kTextColor,
//                           fontSize: 18.0,
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(right: 30.0),
//                         // child: DateTimePicker(
//                         //   type: DateTimePickerType.date,
//                         //   dateMask: 'd MMM, yyyy',
//                         //   initialValue: DateTime.now().toString(),
//                         //   firstDate: DateTime(1950),
//                         //   lastDate: DateTime.now(),
//                         //   icon: Icon(Icons.event),
//                         //   dateLabelText: 'Date',
//                         //   selectableDayPredicate: (date) {
//                         //     // Disable weekend days to select from the calendar
//                         //     if (date.weekday == 6 || date.weekday == 7) {
//                         //       return false;
//                         //     }
//                         //
//                         //     return true;
//                         //   },
//                         //   onChanged: (val) => print(val),
//                         //   validator: (val) {
//                         //     print(val);
//                         //     return null;
//                         //   },
//                         //   onSaved: (val) => print(val),
//                         // ),
//                         child: DateTimePicker(
//                           initialValue: DateTime.now().toString(),
//                           firstDate: DateTime(1950),
//                           lastDate: DateTime.now(),
//                           dateLabelText: 'Date',
//                           onChanged: (val) => print(val),
//                           validator: (val) {
//                             print(val);
//                             return null;
//                           },
//                           onSaved: (value) async {
//                             dob = value;
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(15.0),
//                   child: Column(
//                     children: [
//                       Text(
//                         'Phone Number',
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                           color: kTextColor,
//                           fontSize: 18.0,
//                         ),
//                       ),
//                       TextFormField(
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return "Enter Phone Number";
//                           } else if (value.length != 10) {
//                             return "Enter correct number";
//                           } else {
//                             return null;
//                           }
//                         },
//                         onSaved: (value) async {
//                           phonenumber = value;
//                         },
//                         decoration: InputDecoration(prefixText: '+91'),
//                         keyboardType: TextInputType.number,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(15.0),
//                   child: Column(
//                     children: [
//                       Text(
//                         'Password',
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                           color: kTextColor,
//                           fontSize: 18.0,
//                         ),
//                       ),
//                       TextFormField(
//                         decoration: InputDecoration(
//                           suffixIcon: IconButton(
//                             icon: Icon(securetext
//                                 ? Icons.visibility_off
//                                 : Icons.visibility),
//                             onPressed: () {
//                               setState(() {
//                                 securetext = !securetext;
//                               });
//                             },
//                           ),
//                         ),
//                         obscureText: securetext,
//                         // validator: (value) {
//                         //   if (value!.isEmpty) {
//                         //     return "Password is required";
//                         //   } else {
//                         //     return null;
//                         //   }
//                         // },
//                         onSaved: (value) async {
//                           password = value.toString();
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
//                         style: ElevatedButton.styleFrom(
//                           primary: kButtonColor, // background
//                           onPrimary: Colors.black, // foreground
//                         ),
//                         onPressed: () => registerUser(),
//                         // onPressed: () {
//                         //   if (_rkey.currentState!.validate()) {
//                         //     Navigator.push(
//                         //       context,
//                         //       MaterialPageRoute(
//                         //         builder: (context) {
//                         //           return PatientLoginPage();
//                         //         },
//                         //       ),
//                         //     );
//                         //   }
//                         //   _rkey.currentState!.save();
//                         //   print(_regusername);
//                         //   print(_regpassword);
//                         //   print(_regphonenum);
//                         //   print(_regdob);
//                         // },
//                         child: Text(
//                           "LOGIN",
//                         )),
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

// Padding(
// padding: const EdgeInsets.all(30.0),
// child: SingleChildScrollView(
// child: Form(
// child: Column(
// children: [
// Container(
// margin: EdgeInsets.all(7.0),
// child: Column(
// children: [
// Text(
// 'OPD ID',
// textAlign: TextAlign.left,
// style: TextStyle(
// color: kTextColor,
// fontSize: 18.0,
// ),
// ),
// TextFormField(
// decoration: InputDecoration(
// hintText: 'Enter the OPD ID',
// border: UnderlineInputBorder(),
// ),
// ),
// ],
// ),
// ),
// Container(
// margin: EdgeInsets.all(7.0),
// child: Column(
// children: [
// Text(
// 'DOB',
// textAlign: TextAlign.left,
// style: TextStyle(
// color: kTextColor,
// fontSize: 18.0,
// ),
// ),
// TextFormField(
// decoration: InputDecoration(
// hintText: 'DD/MM/YYYY',
// border: UnderlineInputBorder(),
// suffixIcon: IconButton(
// icon: Icon(
// Icons.calendar_today_outlined,
// ),
// onPressed: () async {
// var selecteddate = await showDatePicker(
// context: context,
// initialDate: DateTime.now(),
// firstDate: DateTime(1900),
// lastDate: DateTime.now(),
// );
// },
// ),
// ),
// ),
// ],
// ),
// ),
// Container(
// margin: EdgeInsets.all(7.0),
// child: Column(
// children: [
// Text(
// 'Phone Number',
// textAlign: TextAlign.left,
// style: TextStyle(
// color: kTextColor,
// fontSize: 18.0,
// ),
// ),
// TextFormField(
// decoration: InputDecoration(prefixText: '+91'),
// keyboardType: TextInputType.number,
// ),
// ],
// ),
// ),
// Container(
// margin: EdgeInsets.all(7.0),
// child: Column(
// children: [
// Text(
// 'Password',
// textAlign: TextAlign.left,
// style: TextStyle(
// color: kTextColor,
// fontSize: 18.0,
// ),
// ),
// TextFormField(
// decoration: InputDecoration(
// suffixIcon: IconButton(
// icon: Icon(securetext
// ? Icons.visibility_off
//     : Icons.visibility),
// onPressed: () {
// setState(() {
// securetext = !securetext;
// });
// },
// ),
// ),
// obscureText: securetext,
// ),
// ],
// ),
// ),
// Container(
// margin: EdgeInsets.all(25.0),
// child: SizedBox(
// height: 50.0,
// width: 150.0,
// child: ElevatedButton(
// style: ElevatedButton.styleFrom(
// primary: kButtonColor, // background
// onPrimary: Colors.black, // foreground
// ),
// onPressed: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) {
// return PatientLoginPage();
// },
// ),
// );
// },
// child: Text('SIGN UP'),
// ),
// ),
// ),
// ],
// ),
// ),
// ),
// ),

import 'package:flutter/material.dart';
import 'package:rwf_hospital_registration/statuspage.dart';
import 'constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
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
        body: Center(child: LoginUser()),
      ),
    );
  }
}

class LoginUser extends StatefulWidget {
  LoginUserState createState() => LoginUserState();
}

class LoginUserState extends State {
  final _pkey = GlobalKey<FormState>();
  // For CircularProgressIndicator.
  bool visible = false;
  bool securetext = true;
  // Getting value from TextField widget.
  final useridController = TextEditingController();
  final passwordController = TextEditingController();

  Future userLogin() async {
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    // Getting value from Controller
    String userid = useridController.text;
    String password = passwordController.text;

    // SERVER LOGIN API URL
    var url = 'https://blotchiest-exposure.000webhostapp.com/login_user.php';

    // Store all data with Param Name.
    var data = {'userid': userid, 'password': password};

    // Starting Web API Call.
    var response = await http.post(Uri.parse(url), body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If the Response Message is Matched.
    if (message == 'Login Matched') {
      // Hiding the CircularProgressIndicator.
      setState(() {
        visible = false;
      });

      // Navigate to Profile Screen & Sending Email to Next Screen.
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StatusPage(userid: useridController.text),
        ),
      );
    } else {
      // If Email or Password did not Matched.
      // Hiding the CircularProgressIndicator.
      setState(() {
        visible = false;
      });

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Center(
      child: Form(
        key: _pkey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(25.0),
            ),

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
                  TextFormField(
                    controller: useridController,
                    autocorrect: true,
                    // decoration:
                    //     InputDecoration(hintText: 'Enter Your User ID Here'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "User ID cannot be empty";
                      } else {
                        return null;
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
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
                  TextFormField(
                    controller: passwordController,
                    autocorrect: true,
                    obscureText: securetext,
                    decoration: InputDecoration(
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password is required";
                      } else {
                        return null;
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 50.0,
              width: 140.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kButtonColor, // background
                  onPrimary: Colors.black, // foreground
                ),
                onPressed: () {
                  if (_pkey.currentState!.validate()) {
                    userLogin();
                  }
                },
                // userLogin,
                child: Text('LOGIN'),
              ),
            ),
            // RaisedButton(
            //   onPressed: userLogin,
            //   color: kButtonColor,
            //   textColor: Colors.white,
            //   padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
            //   child: Text('LOGIN'),
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

// class PatientLoginPage extends StatefulWidget {
//   const PatientLoginPage({Key? key}) : super(key: key);
//
//   @override
//   _PatientLoginPageState createState() => _PatientLoginPageState();
// }
//
// class _PatientLoginPageState extends State<PatientLoginPage> {
//   bool securetext = true;
//   String usernamelogin = 'admin';
//   String userpassword = 'admin';
//
//   final _pkey = GlobalKey<FormState>();
//
//   String _pusername = '';
//   String _ppassword = '';
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
//           padding: EdgeInsets.all(30.0),
//           child: Form(
//             key: _pkey,
//             child: Column(
//               children: <Widget>[
//                 Container(
//                   margin: EdgeInsets.all(20.0),
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
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return "User ID cannot be empty";
//                           } else if (value != usernamelogin) {
//                             return "Enter correct User ID";
//                           } else {
//                             return null;
//                           }
//                         },
//                         onSaved: (value) async {
//                           _pusername = value.toString();
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(20.0),
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
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return "Password is required";
//                           } else if (value != userpassword) {
//                             return "Enter correct Password";
//                           } else {
//                             return null;
//                           }
//                         },
//                         onSaved: (value) async {
//                           _ppassword = value.toString();
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(35.0),
//                   child: SizedBox(
//                     height: 50.0,
//                     width: 140.0,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         primary: kButtonColor, // background
//                         onPrimary: Colors.black, // foreground
//                       ),
//                       onPressed: () {
//                         if (_pkey.currentState!.validate()) {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) {
//                                 return StatusPage();
//                               },
//                             ),
//                           );
//                         }
//                         _pkey.currentState!.save();
//                         print(_pusername);
//                         print(_ppassword);
//                       },
//                       child: Text("LOGIN"),
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

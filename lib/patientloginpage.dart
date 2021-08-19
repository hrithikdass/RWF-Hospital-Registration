import 'package:flutter/material.dart';
import 'package:rwf_hospital_registration/statuspage.dart';
import 'constants.dart';

class PatientLoginPage extends StatefulWidget {
  const PatientLoginPage({Key? key}) : super(key: key);

  @override
  _PatientLoginPageState createState() => _PatientLoginPageState();
}

class _PatientLoginPageState extends State<PatientLoginPage> {
  bool securetext = true;

  final _pkey = GlobalKey<FormState>();

  String _pusername = '';
  String _ppassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital Management'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: Form(
            key: _pkey,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20.0),
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "User ID cannot be empty";
                          } else if (value.length <= 5) {
                            return "User ID show be greater than 5";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) async {
                          _pusername = value.toString();
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
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
                        obscureText: securetext,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password is required";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) async {
                          _ppassword = value.toString();
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(35.0),
                  child: SizedBox(
                    height: 50.0,
                    width: 140.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: kButtonColor, // background
                        onPrimary: Colors.black, // foreground
                      ),
                      onPressed: () {
                        if (_pkey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return StatusPage();
                              },
                            ),
                          );
                        }
                        _pkey.currentState!.save();
                        print(_pusername);
                        print(_ppassword);
                      },
                      child: Text("LOGIN"),
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

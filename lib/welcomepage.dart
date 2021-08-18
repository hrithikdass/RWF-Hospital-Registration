import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rwf_hospital_registration/patientloginpage.dart';
import 'package:rwf_hospital_registration/registerpage.dart';
import 'constants.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hospital Registration',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40.0),
              child: Column(
                children: [
                  Text(
                    'Welcome!',
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 100.0),
              child: Column(
                children: [
                  Text(
                    'Existing Users',
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 50.0,
                    width: 170.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: kButtonColor, // background
                        onPrimary: Colors.black, // foreground
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return PatientLoginPage();
                            },
                          ),
                        );
                      },
                      child: Text('LOGIN'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40.0),
              child: Column(
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 50.0,
                    width: 170.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: kButtonColor, // background
                        onPrimary: Colors.black, // foreground
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return RegisterPage();
                            },
                          ),
                        );
                      },
                      child: Text('SIGN UP'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

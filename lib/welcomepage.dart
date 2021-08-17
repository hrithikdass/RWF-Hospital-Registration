import 'package:flutter/material.dart';
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome!',
              style: TextStyle(
                color: kTextColor,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Existing Users',
              style: TextStyle(
                color: kTextColor,
              ),
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
            Text(
              'Don\'t have an account?',
              style: TextStyle(
                color: kTextColor,
              ),
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
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rwf_hospital_registration/doctorlogin.dart';
import 'constants.dart';
import 'welcomepage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital Registration'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                        return WelcomePage();
                      },
                    ),
                  );
                },
                child: Text('PATIENT'),
              ),
            ),
            SizedBox(
              height: 35.0,
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
                        return DoctorLogin();
                      },
                    ),
                  );
                },
                child: Text('DOCTOR'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

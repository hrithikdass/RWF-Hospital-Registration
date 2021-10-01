import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rwf_hospital_registration/doctorlogin.dart';
import 'constants.dart';
import 'welcomepage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital Registration'),
        backgroundColor: kAppBar,
        actions: [FeedbackMail()],
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.menu),
        // ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 60.0,
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
                child: Text(
                  'PATIENT',
                  style: TextStyle(fontSize: 17.0),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            SizedBox(
              height: 60.0,
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
                child: Text(
                  'DOCTOR',
                  style: TextStyle(fontSize: 17.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

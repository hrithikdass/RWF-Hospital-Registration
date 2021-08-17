import 'package:flutter/material.dart';
import 'statuspage.dart';
import 'constants.dart';

class PatientLoginPage extends StatefulWidget {
  const PatientLoginPage({Key? key}) : super(key: key);

  @override
  _PatientLoginPageState createState() => _PatientLoginPageState();
}

class _PatientLoginPageState extends State<PatientLoginPage> {
  bool securetext = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital Management'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Text(
              'User ID',
              style: TextStyle(
                color: kTextColor,
                fontSize: 18.0,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter the User ID',
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                      securetext ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      securetext = !securetext;
                    });
                  },
                ),
              ),
              obscureText: securetext,
            ),
            Container(
              margin: EdgeInsets.all(30.0),
              child: SizedBox(
                height: 48.0,
                width: 138.0,
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
                          return StatusPage();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const kButtonColor = Color(0xFFFF4181);

const kTextColor = Color(0xFFEA4B81);

const kTextLight = Color(0xFF9B9B9B);

const kAppBar = Color(0xFF3F51B5);

sendingMails() async {
  const url = 'mailto:hrithikdas@gmail.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class FeedbackMail extends StatelessWidget {
  const FeedbackMail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        onSelected: (v) {
          sendingMails();
        },
        itemBuilder: (context) => [
              PopupMenuItem(
                child: Text(
                  "  Feedback",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
                value: 1,
              ),
            ]);
  }
}

// ignore_for_file: deprecated_member_use

import 'package:chatapp/pages/safetytips.dart';
import 'package:chatapp/pages/sakhihomepage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/widgets.dart';
import 'Articles.dart';
import 'ComplaintCounter.dart';
import 'helpline.dart';
import 'news.dart';

class courses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scrollable Card',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String cardText = "Why YOU'LL ENROLL FOR Sexual Harassment Course?\n\n"
      "Sexual harassment courses are important because they help to prevent sexual harassment from occurring, raise awareness about its harmful effects, ensure legal compliance, and hold individuals accountable for their actions.\n\n"
      "This course is intended for any user who can be a worker/ an employee/ an employer/ an executive/ a board member/ HR/ vendor/ CEOs / CA / CS / CLOs / ICC Members / Local Complaints Committee and for all those who want to be aware about Sexual Harassment & its Prevention.\n\n"
      "Here's what you'll learn from this course:\n"
      "• Discover how you can handle sexual harassment issues and complaints\n"
      "• Get a detailed overview of 'The Sexual Harassment of Women at Workplace (Prevention, Prohibition, and Redressal)' or the PoSH Act 2013\n"
      "• Learn the various duties of the employer/employee to curb harassment\n"
      "• Learn the redress mechanism to handle sexual harassment complaints.\n\n"
      "Sexual harassment courses also help to raise awareness about the prevalence of sexual harassment and the harm it can cause. Many people may not fully understand what constitutes sexual harassment or the impact it can have on victims. Sexual harassment courses can help to change that by providing information and real-life examples of sexual harassment.";

  final String url =
      'https://www.tuvsud.com/en-in/landing/asmea/prevention-of-sexual-harassment-course?utm_source=google&utm_medium=cpc&utm_campaign=2022_posh-elearning_ea_in_ba_aca_lds_ts&utm_content=training-course&gclid=Cj0KCQiA6rCgBhDVARIsAK1kGPLLODNLQI3_Q0QdjFTzVz_0keIVJ9posOC4ePTgCCqhSOkxVuY9v8MaAk2gEALw_wcB';

  @override
  Widget build(BuildContext context) {
    Widget _buildButton(BuildContext context, String text,
        {Color textColor = Colors.white, VoidCallback? onPressed}) {
      return ElevatedButton(
        child: Text(text, style: TextStyle(color: textColor)),
        onPressed: onPressed,
      );
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 179, 202, 226),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 88, 148, 221),
        title: Row(
          children: [
            const Text("Sakhi", style: TextStyle(color: Colors.black)),
            const SizedBox(width: 657.0),
            Row(
              children: [
                _buildButton(context, "Home", textColor: Colors.black,
                    onPressed: () {
                  nextScreenReplace(context, sakhihomepage());
                }),
                const SizedBox(width: 8.0),
                _buildButton(context, "Articles", textColor: Colors.black,
                    onPressed: () {
                  nextScreenReplace(context, Articles());
                }),
                const SizedBox(width: 8.0),
                _buildButton(context, "Courses", textColor: Colors.black,
                    onPressed: () {
                  nextScreen(context, courses());
                }),
                const SizedBox(width: 8.0),
                _buildButton(context, "Complaint Counter",
                    textColor: Colors.black, onPressed: () {
                  nextScreenReplace(context, complaincounter());
                }),
                SizedBox(
                  width: 8.0,
                ),
                _buildButton(context, "HelpLine", textColor: Colors.black,
                    onPressed: () {
                  nextScreenReplace(context, helplinepage());
                }),
                const SizedBox(width: 8.0),
                _buildButton(context, "Safety tips", textColor: Colors.black,
                    onPressed: () {
                  nextScreenReplace(
                    context,
                    safetytipspage(),
                  );
                }),
                SizedBox(
                  width: 8.0,
                ),
                _buildButton(context, "News", textColor: Colors.black,
                    onPressed: () {
                  nextScreenReplace(context, Newspage());
                }),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              color: Color.fromARGB(225, 143, 177, 213),
              child: Padding(
                padding: const EdgeInsets.all(26.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Why YOU'LL ENROLL FOR Sexual Harassment Course?",
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Color.fromARGB(
                            255, 11, 104, 180), // Change the color to blue
                        fontWeight: FontWeight.bold, // Add bold font weight
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      cardText,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Go to Course'),
              onPressed: () async {
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

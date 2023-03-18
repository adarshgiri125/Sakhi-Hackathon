import 'package:chatapp/helper/helper_function.dart';
import 'package:chatapp/pages/ComplaintCounter.dart';
import 'package:chatapp/pages/chatbot.dart';
import 'package:chatapp/pages/group_chat.dart';
import 'package:chatapp/pages/home_page.dart';
import 'package:chatapp/pages/news.dart';
import 'package:chatapp/pages/safetytips.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'dart:async';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/widgets.dart';
import 'Articles.dart';
import 'courses.dart';
import 'helpline.dart';

Future<void> _getLocation2() async {
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);

  print("Latitude: ${position.latitude}");
  print("Longitude: ${position.longitude}");

  Map<String, String> datatosave = {
    'lattitude': "Latitude: ${position.latitude}",
    'longitude': "Longitude: ${position.longitude}"
  };
  FirebaseFirestore.instance.collection('location');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? Phone = prefs.getString("Start");
  var Service_id = 'service_bisbnxm',
      Template_id = 'template_86q5k2d',
      User_id = '7t8wmHOzo1D0FSX1H';
  var s = http.post(Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
      headers: {'origin': 'http:localhost', 'Content-Type': 'application/json'},
      body: jsonEncode({
        'service_id': Service_id,
        'user_id': User_id,
        'template_id': Template_id,
        'template_params': {
          'phone': Phone,
          'loc': 'Help i am being harraased at ' +
              "Latitude: ${position.latitude} " +
              "Longitude: ${position.longitude}" +
              'https://www.google.com/maps/search/?api=1&query=${position.latitude},${position.longitude}',
          'sender_email': 'ja883526@gmail.com'
        }
      }));
}

class sakhihomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scrollable Card',
      home: firstHomePage(),
    );
  }
}

void _showHelpDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Help"),
        content: const Text("Please select one of the following options:"),
        actions: [
          ElevatedButton(
            child: const Text("Inform only Police"),
            onPressed: () {
              _getLocation2();

              Navigator.of(context).pop();
              _showToast(context);
            },
          ),
          ElevatedButton(
            child: const Text("Inform Community + police"),
            onPressed: () {
              _getLocation2();

              Navigator.of(context).pop();
              nextScreenReplace(context, const HomePage());
              _showToast(context);
            },
          ),
        ],
      );
    },
  );
}

class firstHomePage extends StatelessWidget {
  Widget _buildButton(BuildContext context, String text,
      {Color textColor = Colors.white, VoidCallback? onPressed}) {
    return ElevatedButton(
      child: Text(text, style: TextStyle(color: textColor)),
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  {
                    nextScreen(context, courses());
                  }
                }),
                const SizedBox(width: 8.0),
                _buildButton(context, "Complaint Counter",
                    textColor: Colors.black, onPressed: () {
                  nextScreenReplace(context, complaincounter());
                }),
                const SizedBox(
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
                const SizedBox(
                  width: 8.0,
                ),
                _buildButton(context, "News", textColor: Colors.black,
                    onPressed: () {
                  nextScreenReplace(context, const Newspage());
                }),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Wrap(
        //will break to another line on overflow
        direction: Axis.horizontal, //use vertical to show  on vertical axis
        children: <Widget>[
          Container(
              margin: EdgeInsets.all(10),
              child: FloatingActionButton(
                tooltip: 'Chat with other people',
                onPressed: () {
                  nextScreenReplace(
                      context,
                      GroupListScreen(
                          currentUserUid: HelperFunctions.userNameKey));
                },
                child: Icon(Icons.chat_bubble_sharp),
              )), //button first

          Container(
              margin: EdgeInsets.all(10),
              child: FloatingActionButton(
                tooltip: 'Chat with AI counsellor',
                onPressed: () {
                  nextScreenReplace(
                      context, chatbot()); //action code for button 2
                },
                backgroundColor: Colors.deepPurpleAccent,
                child: Icon(Icons.task_alt_sharp),
              )), // button second
          // Add more buttons here
        ],
      ),
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // set the mainAxisAlignment to center
        children: [
          const SizedBox(height: 1.0),
          const Text("Sakhi",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 38)),
          const SizedBox(height: 32.0),
          const SizedBox(height: 8.0),
          const Text("We won't be sharing your private information.",
              style: TextStyle(color: Colors.black, fontSize: 24)),
          const SizedBox(height: 32.0),
          ElevatedButton(
            child: const Text(
              "Help",
            ),
            style: ElevatedButton.styleFrom(primary: const Color(0xff131313)),
            onPressed: () {
              _showHelpDialog(context);
            },
          ),
          const SizedBox(height: 32.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        ],
      ),
    );
  }
}

Widget _buildRegistrationButton(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(16.0),
    child: ElevatedButton(
      child: const Text("Register", style: TextStyle(color: Colors.black)),
      style: ElevatedButton.styleFrom(primary: const Color(0xfff4f4f4)),
      onPressed: () {},
    ),
  );
}

Widget _buildLoginButton(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(16.0),
    child: ElevatedButton(
      child: const Text("Sign-in", style: TextStyle(color: Colors.black)),
      style: ElevatedButton.styleFrom(primary: const Color(0xfff4f4f4)),
      onPressed: () {},
    ),
  );
}

void _showToast(BuildContext context) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: const Text('location sent'),
      action:
          SnackBarAction(label: '', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}

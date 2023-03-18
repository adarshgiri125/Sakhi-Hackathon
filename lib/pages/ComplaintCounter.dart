import 'dart:convert';
import 'dart:async';

import 'package:chatapp/pages/news.dart';
import 'package:chatapp/pages/safetytips.dart';
import 'package:chatapp/pages/sakhihomepage.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../widgets/widgets.dart';
import 'Articles.dart';
import 'courses.dart';
import 'helpline.dart';

TextEditingController name = TextEditingController();
TextEditingController phone = TextEditingController();
TextEditingController complaint = TextEditingController();

class complaincounter extends StatelessWidget {
  Widget _buildButton(BuildContext context, String text,
      {Color textColor = Colors.white, VoidCallback? onPressed}) {
    return ElevatedButton(
      child: Text(text, style: TextStyle(color: textColor)),
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        body: Padding(
          padding: const EdgeInsets.fromLTRB(400, 0, 400, 10),
          child: Center(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text("Your information would be kept secured"),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Color.fromARGB(255, 24, 4, 243),
                    width: 1.0,
                  ),
                ),
                child: TextFormField(
                  controller: name,
                  decoration: const InputDecoration(
                    hintText: 'Full name',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Color.fromARGB(255, 13, 17, 233),
                    width: 1.0,
                  ),
                ),
                child: TextFormField(
                  controller: phone,
                  decoration: const InputDecoration(
                    hintText: 'Phone number',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Color.fromARGB(255, 13, 42, 234),
                    width: 1.0,
                  ),
                ),
                child: TextFormField(
                  controller: complaint,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    hintText: 'Type your complaint',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please type your queries';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Container(
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 47, 7, 226)),
                      onPressed: () {
                        _getLocation();

                        _showToast(context);
                      },
                      icon: Icon(
                        Icons.mail,
                        color: Colors.blue,
                      ),
                      label: Text(
                        'Submit',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }

  void Send_mail() {
    var Service_id = 'service_bisbnxm',
        Template_id = 'template_xif2vtd',
        User_id = '7t8wmHOzo1D0FSX1H';
    var s = http.post(Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
        headers: {
          'origin': 'http:localhost',
          'Content-Type': 'application/json'
        },
        body: jsonEncode({
          'service_id': Service_id,
          'user_id': User_id,
          'template_id': Template_id,
          'template_params': {
            'name': name.text,
            'message': "${complaint.text}",
            'phone': "${phone.text}",
          }
        }));
  }

  Future<void> _getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    print("Latitude: ${position.latitude}");
    print("Longitude: ${position.longitude}");

    var Service_id = 'service_bisbnxm',
        Template_id = 'template_xif2vtd',
        User_id = '7t8wmHOzo1D0FSX1H';
    var s = http.post(Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
        headers: {
          'origin': 'http:localhost',
          'Content-Type': 'application/json'
        },
        body: jsonEncode({
          'service_id': Service_id,
          'user_id': User_id,
          'template_id': Template_id,
          'template_params': {
            'name': name.text,
            'message': "${complaint.text}",
            'phone': "${phone.text}",
          }
        }));

    // var Service_id = 'service_bisbnxm',
    //     Template_id = 'template_86q5k2d',
    //     User_id = '7t8wmHOzo1D0FSX1H';
    // var s = http.post(Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
    //     headers: {
    //       'origin': 'http:localhost',
    //       'Content-Type': 'application/json'
    //     },
    //     body: jsonEncode({
    //       'service_id': Service_id,
    //       'user_id': User_id,
    //       'template_id': Template_id,
    //       'template_params': {
    //         'name': name.text,
    //         'message': "${complaint.text}",
    //         'phone': "${phone.text}",
    //         'loc': "Latitude: ${position.latitude} " +
    //             "Longitude: ${position.longitude}"
    //       }
    //     }));

    Map<String, String> datatosave = {
      'lattitude': "Latitude: ${position.latitude}",
      'longitude': "Longitude: ${position.longitude}"
    };
    FirebaseFirestore.instance.collection('location');
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Complaint sent'),
        action:
            SnackBarAction(label: '', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}

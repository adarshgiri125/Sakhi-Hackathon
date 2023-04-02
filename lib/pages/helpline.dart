import 'package:chatapp/pages/safetytips.dart';
import 'package:chatapp/pages/sakhihomepage.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';
import 'Articles.dart';
import 'ComplaintCounter.dart';
import 'courses.dart';
import 'news.dart';

class helplinepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scrollable Card',
      home: HelplineScreen(),
    );
  }
}

class HelplineScreen extends StatelessWidget {
  final List<Map<String, String>> helplines = [
    {'name': 'Women In Distress ', 'number': '1091'},
    {'name': 'Women Helpline Domestic Abuse', 'number': '181'},
    {'name': 'Police', 'number': '112 / 100'},
    {
      'name':
          'National Commison For Women (NCW) ( Domestic voilence 24x7 helpline )',
      'number': '7827170170'
    },
    {
      'name': 'National Commison For Women (NCW)',
      'number': '26942369, 26944754'
    },
    {
      'name': 'Delhi Commision For Women',
      'number': ' 011-23378044 / 23378317 / 23370597'
    },
    {'name': 'Outer Delhi Helpline', 'number': '011-27034873 , 27034874'},
    {'name': 'Student / Child Helpline', 'number': '1098'},
    {
      'name': 'National Human Right Commision ',
      'number': '011-23385368/9810298900 '
    },
  ];

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
            Spacer(),
            _buildButton(context, "Home", textColor: Colors.black, onPressed: () {
              nextScreenReplace(context, sakhihomepage());
            }),
            const SizedBox(width: 8.0),
            _buildButton(context, "Articles", textColor: Colors.black, onPressed: () {
              nextScreenReplace(context, Articles());
            }),
            const SizedBox(width: 8.0),
            _buildButton(context, "Courses", textColor: Colors.black, onPressed: () {
              nextScreenReplace(context, courses());
            }),
            const SizedBox(width: 8.0),
            _buildButton(context, "Complaint Counter", textColor: Colors.black, onPressed: () {
              nextScreenReplace(context, complaincounter());
            }),
            const SizedBox(width: 8.0),
            _buildButton(context, "HelpLine", textColor: Colors.black, onPressed: () {
              nextScreenReplace(context, helplinepage());
            }),
            const SizedBox(width: 8.0),
            _buildButton(context, "Safety Tips", textColor: Colors.black, onPressed: () {
              nextScreenReplace(context, safetytipspage());
            }),
            const SizedBox(width: 8.0),
            _buildButton(context, "News", textColor: Colors.black, onPressed: () {
              nextScreenReplace(context, Newspage());
            }),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16.0),
            Text(
              'Helpline Numbers',
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.0),
            Expanded(
              child: ListView.builder(
                itemCount: helplines.length,
                itemBuilder: (BuildContext context, int index) {
                  final helpline = helplines[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          helpline['name']!,
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Text(
                          helpline['number']!,
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );

  }
}
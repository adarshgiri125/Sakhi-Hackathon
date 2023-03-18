import 'package:chatapp/pages/helpline.dart';
import 'package:chatapp/pages/news.dart';
import 'package:chatapp/pages/safetytips.dart';
import 'package:chatapp/pages/sakhihomepage.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';
import 'ComplaintCounter.dart';
import 'courses.dart';

class Articles extends StatelessWidget {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
                child: Text(
              ' Articles',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 38.0,
              ),
            )),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(60.0, 15, 30, 5),
                      child: CardWidget1(
                        title: 'Equality before Law',
                        content:
                            'Article 14 embodies the general principles of equality before law and equal protection of laws. Prohibition from discrimination on grounds of religion, race, caste, sex or place of birth. Article 15(1) and (2) prohibits the state from discriminating against any citizen only on the basis of any one or more of the aspects such as religion, race, caste,'
                            'sex, place of birth or any of them. Article 15(3) makes it possible for the state to create special provisions for protecting the interests of women and children. Article 15(4) capacitates the State to create special arrangements for promoting interests and welfare of socially and educationally backward classes of society.',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30.0, 15, 60, 5),
                      child: CardWidget1(
                        title: 'Equality of Opportunity ',
                        content:
                            'Article 16 provides for equality of opportunity for all citizens in matters relating to employment or appointment to any office under the State. Article 39 requires the State to'
                            'direct its policy towards securing for men and women equally the right to an adequate means of livelihood [Article 39(a)] and equal pay for equal work for both men and women [Article 39(d)]. Article 39A directs the State to promote justice, on the basis of equal opportunity and to promote free legal aid by suitable legislation or scheme or in any other way to ensure that opportunities for securing justice are not denied to any citizen by reason of economic or other disabilities.',
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(60.0, 30, 30, 60),
                      child: CardWidget1(
                        title: 'Humane Conditions at Work',
                        content:
                            'Article 42 directs the State to make provision for securing justice and humane conditions of work and for maternity relief.'
                            'sex, place of birth or any of them. Article 15(3) makes it possible for protecting the interests of women and children. Article 15(4) capacitates the State to create special arrangements for promoting interests and welfare of socially and educationally backward classes of society.',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30.0, 30, 60, 60),
                      child: CardWidget1(
                          title:
                              'Reservation of seats for Women in Panchayats and Municipalities',
                          content:
                              'Article 243 D (3) and Article 243 T(3) provide for reservation of not less than one third of total number of seats in Panchayats and Municipalities for women to be allotted by rotation to different Constituencies. Article 243 D(4) T(4) provides that not less than one third of the total number of officers of chairperson in the Panchayat and Municipalities at each level to be reserved for women'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CardWidget1 extends StatelessWidget {
  final String title;
  final String content;

  CardWidget1({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 143, 177, 213), // set the color to grey
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              child: Text(content),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Know More',
                    style: TextStyle(color: Colors.black)),
                style:
                    ElevatedButton.styleFrom(primary: const Color(0xfff4f4f4)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

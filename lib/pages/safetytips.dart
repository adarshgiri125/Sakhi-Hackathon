import 'package:chatapp/pages/sakhihomepage.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';
import 'Articles.dart';
import 'ComplaintCounter.dart';
import 'courses.dart';
import 'helpline.dart';
import 'news.dart';

void opentipssafety() {
  runApp(MaterialApp(
    home: safetytipspage(),
  ));
}

class MyCard extends StatefulWidget {
  final String title;
  final String description;

  const MyCard({required this.title, required this.description});

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(225, 143, 177, 213),
      // ignore: sort_child_properties_last
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            trailing: IconButton(
              icon: Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
          ),
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                widget.description,
                style: const TextStyle(fontSize: 18.0),
              ),
            ),
        ],
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    );
  }
}

class safetytipspage extends StatelessWidget {
  final List<MyCard> cards = [
    const MyCard(
      title: 'Be aware of your surroundings',
      description:
          'Being aware of your surroundings means staying alert and paying attention to your environment. This can include looking out for potential hazards or threats, and being mindful of any suspicious behavior. If you notice anything that makes you feel uncomfortable or unsafe, it is important to trust your instincts and remove yourself from the situation ',
    ),
    const MyCard(
      title: 'Report any harassment:',
      description:
          'Reporting any incidents of harassment is critical for ensuring that the perpetrator is held accountable and that the behavior is stopped. Make sure to report any incidents to your supervisor or HR representative as soon as possible, and provide as much detail as possible about the incident, including any witnesses or evidence.',
    ),
    const MyCard(
      title: 'Keep documentation:',
      description:
          'Keeping detailed records of any incidents of harassment can be crucial if you need to file a formal complaint or take legal action. Make sure to document the date, time, location, and any witnesses present, as well as any other relevant details. This can help support your case and provide evidence if necessary.',
    ),
    const MyCard(
      title: 'Avoid isolated areas:',
      description:
          ' Isolated areas can be particularly risky, as they provide less opportunity for others to intervene or help in case of an incident. If you need to be in an isolated area, make sure to take appropriate precautions and let someone know where you are and how long you expect to be there.',
    ),
    const MyCard(
      title: 'Use the buddy system:',
      description:
          'The buddy system involves working with a colleague or friend whenever possible, especially in situations that could be risky or potentially dangerous. This can provide an additional level of safety and support, as well as help deter any potential harassment. Make sure to establish clear boundaries and communication with your buddy to ensure that you are both on the same page about your roles and responsibilities.',
    ),
    const MyCard(
      title: 'Dress appropriately:',
      description:
          ' Dressing appropriately can help prevent unwanted attention or harassment in the workplace. Make sure to dress professionally and in a manner that is appropriate for your workplace culture and dress code. Avoid clothing that is overly revealing or provocative, as this can make you a target for harassment.',
    ),
    const MyCard(
        title: 'Practice assertiveness:',
        description:
            ' Practicing assertiveness means setting clear boundaries and communicating them effectively. If someone is engaging in behavior that makes you uncomfortable, it is important to speak up and let them know that their behavior is not acceptable. Make sure to remain calm and professional, and be clear about what you expect from them going forward.'),
    const MyCard(
        title: 'Attend training sessions:',
        description:
            ' Many workplaces offer training sessions on harassment prevention and workplace safety. These sessions can provide valuable information and tools for preventing and addressing harassment in the workplace. Make sure to attend any training sessions offered by your employer, and take advantage of any other resources available to you.')
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

    final width = MediaQuery.of(context).size.width;

    if (width > 600) {
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
                        MaterialApp(
                          home: safetytipspage(),
                        ));
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
          padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 16.0),
          child: Wrap(
            spacing: 16.0,
            runSpacing: 16.0,
            children: cards,
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffd9d5d5),
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
          padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 16.0),
          child: ListView.builder(
            itemCount: cards.length,
            itemBuilder: (BuildContext context, int index) {
              return cards[index];
            },
          ),
        ),
      );
    }
  }
}

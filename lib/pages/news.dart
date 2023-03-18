import 'package:chatapp/pages/product.dart';
import 'package:chatapp/pages/safetytips.dart';
import 'package:chatapp/pages/sakhihomepage.dart';
import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import '../widgets/widgets.dart';
import 'Articles.dart';
import 'ComplaintCounter.dart';
import 'courses.dart';
import 'helpline.dart';

class Newspage extends StatelessWidget {
  const Newspage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: SnappingList()),
    );
  }
}

class SnappingList extends StatefulWidget {
  const SnappingList({Key? key}) : super(key: key);

  @override
  _SnappingListState createState() => _SnappingListState();
}

class _SnappingListState extends State<SnappingList> {
  List<Product> productList = [
    Product(
        'Lounge Manager At Delhi Airport Arrested In Sexual Harassment',
        'A 42-year-old general manager of a lounge at the Delhi airport and his '
            '37-yearold colleague were\n arrested on Thursday after a woman employee'
            ' accused them of sexual harassment at the workplace\n police said. The'
            'lounge is operated by a tenanted privately-run third party operator. '
            'The 26-year-old \nwoman worked as a Food and Beverages Assistant in the '
            'lounge at Terminal-3 of the Indira Gandhi \nInternational Airport, they said'
            '. In her complaint filed on Tuesday, the woman said that she was\n sacked'
            'from the job the same day, and alleged sexual harassment by the lounges '
            'general manager \n and the duty manager, police said. According to the '
            'complainant, the two used to harass\n and threaten her that she will be '
            'fired if she raised a voice against it. The woman \n was eventually thrown'
            ' out of her job after she refused their sexual advances, the complaint stated\n'
            'A  general manager of a lounge at the Delhi airport and his '
            ' colleague were\n arrested on Thursday after a woman employee'
            ' accused them of sexual harassment at the workplace\n police said. The'
            'lounge is operated by a tenanted privately-run third party operator. '
            'The 26-year-old \nwoman worked as a Food and Beverages Assistant in the '
            'lounge at Terminal-3 of the Indira Gandhi \nInternational Airport, they said'
            '. In her complaint filed on Tuesday, the woman said that she was\n sacked'
            'from the job the same day, and alleged sexual harassment by the lounges '
            'general manager \n and the duty manager, police said. According to the '
            'complainant, the two used to harass\n and threaten her that she will be '
            'fired if she raised a voice against it. The woman \n was eventually thrown'
            ' out of her job after she refused their sexual advances, the complaint stated\n'
            'from the job the same day, and alleged sexual harassment by the lounges '
            'general manager \n and the duty manager, police said. According to the '
            'complainant, the two used to harass\n and threaten her that she will be '
            'fired if she raised a voice against it. The woman \n was eventually thrown',
        15),
    Product(
        'Women need justice',
        'A 42-year-old general manager of a lounge at the Delhi airport and his '
            '37-yearold colleague were\n arrested on Thursday after a woman employee'
            ' accused them of sexual harassment at the workplace\n police said. The'
            'lounge is operated by a tenanted privately-run third party operator. '
            'The 26-year-old \nwoman worked as a Food and Beverages Assistant in the '
            'lounge at Terminal-3 of the Indira Gandhi \nInternational Airport, they said'
            '. In her complaint filed on Tuesday, the woman said that she was\n sacked'
            'from the job the same day, and alleged sexual harassment by the lounges '
            'general manager \n and the duty manager, police said. According to the '
            'complainant, the two used to harass\n and threaten her that she will be '
            'fired if she raised a voice against it. The woman \n was eventually thrown'
            ' out of her job after she refused their sexual advances, the complaint stated\n'
            'A  general manager of a lounge at the Delhi airport and his '
            ' colleague were\n arrested on Thursday after a woman employee'
            ' accused them of sexual harassment at the workplace\n police said. The'
            'lounge is operated by a tenanted privately-run third party operator. '
            'The 26-year-old \nwoman worked as a Food and Beverages Assistant in the '
            'lounge at Terminal-3 of the Indira Gandhi \nInternational Airport, they said'
            '. In her complaint filed on Tuesday, the woman said that she was\n sacked'
            'from the job the same day, and alleged sexual harassment by the lounges '
            'general manager \n and the duty manager, police said. According to the '
            'complainant, the two used to harass\n and threaten her that she will be '
            'fired if she raised a voice against it. The woman \n was eventually thrown'
            ' out of her job after she refused their sexual advances, the complaint stated\n'
            'from the job the same day, and alleged sexual harassment by the lounges '
            'general manager \n and the duty manager, police said. According to the '
            'complainant, the two used to harass\n and threaten her that she will be '
            'fired if she raised a voice against it. The woman \n was eventually thrown',
        15),
    Product(
        'Social impact of women harassment reporting',
        'A 42-year-old general manager of a lounge at the Delhi airport and his '
            '37-yearold colleague were\n arrested on Thursday after a woman employee'
            ' accused them of sexual harassment at the workplace\n police said. The'
            'lounge is operated by a tenanted privately-run third party operator. '
            'The 26-year-old \nwoman worked as a Food and Beverages Assistant in the '
            'lounge at Terminal-3 of the Indira Gandhi \nInternational Airport, they said'
            '. In her complaint filed on Tuesday, the woman said that she was\n sacked'
            'from the job the same day, and alleged sexual harassment by the lounges '
            'general manager \n and the duty manager, police said. According to the '
            'complainant, the two used to harass\n and threaten her that she will be '
            'fired if she raised a voice against it. The woman \n was eventually thrown'
            ' out of her job after she refused their sexual advances, the complaint stated\n'
            'A  general manager of a lounge at the Delhi airport and his '
            ' colleague were\n arrested on Thursday after a woman employee'
            ' accused them of sexual harassment at the workplace\n police said. The'
            'lounge is operated by a tenanted privately-run third party operator. '
            'The 26-year-old \nwoman worked as a Food and Beverages Assistant in the '
            'lounge at Terminal-3 of the Indira Gandhi \nInternational Airport, they said'
            '. In her complaint filed on Tuesday, the woman said that she was\n sacked'
            'from the job the same day, and alleged sexual harassment by the lounges '
            'general manager \n and the duty manager, police said. According to the '
            'complainant, the two used to harass\n and threaten her that she will be '
            'fired if she raised a voice against it. The woman \n was eventually thrown'
            ' out of her job after she refused their sexual advances, the complaint stated\n'
            'from the job the same day, and alleged sexual harassment by the lounges '
            'general manager \n and the duty manager, police said. According to the '
            'complainant, the two used to harass\n and threaten her that she will be '
            'fired if she raised a voice against it. The woman \n was eventually thrown',
        15),
    Product(
        'workplaces are bringing new policies on women harassment',
        'A 42-year-old general manager of a lounge at the Delhi airport and his '
            '37-yearold colleague were\n arrested on Thursday after a woman employee'
            ' accused them of sexual harassment at the workplace\n police said. The'
            'lounge is operated by a tenanted privately-run third party operator. '
            'The 26-year-old \nwoman worked as a Food and Beverages Assistant in the '
            'lounge at Terminal-3 of the Indira Gandhi \nInternational Airport, they said'
            '. In her complaint filed on Tuesday, the woman said that she was\n sacked'
            'from the job the same day, and alleged sexual harassment by the lounges '
            'general manager \n and the duty manager, police said. According to the '
            'complainant, the two used to harass\n and threaten her that she will be '
            'fired if she raised a voice against it. The woman \n was eventually thrown'
            ' out of her job after she refused their sexual advances, the complaint stated\n'
            'A  general manager of a lounge at the Delhi airport and his '
            ' colleague were\n arrested on Thursday after a woman employee'
            ' accused them of sexual harassment at the workplace\n police said. The'
            'lounge is operated by a tenanted privately-run third party operator. '
            'The 26-year-old \nwoman worked as a Food and Beverages Assistant in the '
            'lounge at Terminal-3 of the Indira Gandhi \nInternational Airport, they said'
            '. In her complaint filed on Tuesday, the woman said that she was\n sacked'
            'from the job the same day, and alleged sexual harassment by the lounges '
            'general manager \n and the duty manager, police said. According to the '
            'complainant, the two used to harass\n and threaten her that she will be '
            'fired if she raised a voice against it. The woman \n was eventually thrown'
            ' out of her job after she refused their sexual advances, the complaint stated\n'
            'from the job the same day, and alleged sexual harassment by the lounges '
            'general manager \n and the duty manager, police said. According to the '
            'complainant, the two used to harass\n and threaten her that she will be '
            'fired if she raised a voice against it. The woman \n was eventually thrown',
        15),
    Product(
        'women security gadgets are coming soon',
        'A 42-year-old general manager of a lounge at the Delhi airport and his '
            '37-yearold colleague were\n arrested on Thursday after a woman employee'
            ' accused them of sexual harassment at the workplace\n police said. The'
            'lounge is operated by a tenanted privately-run third party operator. '
            'The 26-year-old \nwoman worked as a Food and Beverages Assistant in the '
            'lounge at Terminal-3 of the Indira Gandhi \nInternational Airport, they said'
            '. In her complaint filed on Tuesday, the woman said that she was\n sacked'
            'from the job the same day, and alleged sexual harassment by the lounges '
            'general manager \n and the duty manager, police said. According to the '
            'complainant, the two used to harass\n and threaten her that she will be '
            'fired if she raised a voice against it. The woman \n was eventually thrown'
            ' out of her job after she refused their sexual advances, the complaint stated\n'
            'A  general manager of a lounge at the Delhi airport and his '
            ' colleague were\n arrested on Thursday after a woman employee'
            ' accused them of sexual harassment at the workplace\n police said. The'
            'lounge is operated by a tenanted privately-run third party operator. '
            'The 26-year-old \nwoman worked as a Food and Beverages Assistant in the '
            'lounge at Terminal-3 of the Indira Gandhi \nInternational Airport, they said'
            '. In her complaint filed on Tuesday, the woman said that she was\n sacked'
            'from the job the same day, and alleged sexual harassment by the lounges '
            'general manager \n and the duty manager, police said. According to the '
            'complainant, the two used to harass\n and threaten her that she will be '
            'fired if she raised a voice against it. The woman \n was eventually thrown'
            ' out of her job after she refused their sexual advances, the complaint stated\n'
            'from the job the same day, and alleged sexual harassment by the lounges '
            'general manager \n and the duty manager, police said. According to the '
            'complainant, the two used to harass\n and threaten her that she will be '
            'fired if she raised a voice against it. The woman \n was eventually thrown',
        15),
    Product(
        'Celebs for your help',
        'A 42-year-old general manager of a lounge at the Delhi airport and his '
            '37-yearold colleague were\n arrested on Thursday after a woman employee'
            ' accused them of sexual harassment at the workplace\n police said. The'
            'lounge is operated by a tenanted privately-run third party operator. '
            'The 26-year-old \nwoman worked as a Food and Beverages Assistant in the '
            'lounge at Terminal-3 of the Indira Gandhi \nInternational Airport, they said'
            '. In her complaint filed on Tuesday, the woman said that she was\n sacked'
            'from the job the same day, and alleged sexual harassment by the lounges '
            'general manager \n and the duty manager, police said. According to the '
            'complainant, the two used to harass\n and threaten her that she will be '
            'fired if she raised a voice against it. The woman \n was eventually thrown'
            ' out of her job after she refused their sexual advances, the complaint stated\n'
            'A  general manager of a lounge at the Delhi airport and his '
            ' colleague were\n arrested on Thursday after a woman employee'
            ' accused them of sexual harassment at the workplace\n police said. The'
            'lounge is operated by a tenanted privately-run third party operator. '
            'The 26-year-old \nwoman worked as a Food and Beverages Assistant in the '
            'lounge at Terminal-3 of the Indira Gandhi \nInternational Airport, they said'
            '. In her complaint filed on Tuesday, the woman said that she was\n sacked'
            'from the job the same day, and alleged sexual harassment by the lounges '
            'general manager \n and the duty manager, police said. According to the '
            'complainant, the two used to harass\n and threaten her that she will be '
            'fired if she raised a voice against it. The woman \n was eventually thrown'
            ' out of her job after she refused their sexual advances, the complaint stated\n'
            'from the job the same day, and alleged sexual harassment by the lounges '
            'general manager \n and the duty manager, police said. According to the '
            'complainant, the two used to harass\n and threaten her that she will be '
            'fired if she raised a voice against it. The woman \n was eventually thrown',
        15),
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
        body: SizedBox(
          height: 900,
          child: ScrollSnapList(
            margin: EdgeInsets.all(15),
            itemBuilder: _buildListItem,
            itemCount: productList.length,
            itemSize: 905,
            onItemFocus: (index) {},
            dynamicItemSize: true,
          ),
        ));
  }

  Widget _buildListItem(BuildContext context, int index) {
    Product product = productList[index];
    return SizedBox(
      width: 950,
      height: 850,
      child: Card(
        borderOnForeground: true,
        color: Color.fromARGB(225, 143, 177,
            223), ////////////////////////////////////////////////
        elevation: 12,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                product.title,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 38, 66, 94)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        product.cost,
                        style: const TextStyle(
                            fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:chatapp/pages/sakhihomepage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'chat_screen.dart';
import 'create_group.dart';
import 'package:chatapp/pages/ComplaintCounter.dart';
import 'package:chatapp/pages/news.dart';
import 'package:chatapp/pages/safetytips.dart';

import '../widgets/widgets.dart';
import 'Articles.dart';
import 'courses.dart';
import 'helpline.dart';

class GroupListScreen extends StatefulWidget {
  final String currentUserUid;

  GroupListScreen({Key? key, required this.currentUserUid}) : super(key: key);

  @override
  _GroupListScreenState createState() => _GroupListScreenState();
}

class _GroupListScreenState extends State<GroupListScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _createGroup(String name, String description) async {
    final newGroupRef = await _firestore.collection('groups').add({
      'name': name,
      'description': description,
      'members': [widget.currentUserUid], // add current user as member
    });
    final newGroupId = newGroupRef.id;
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ChatScreen(
        groupId: newGroupId,
        groupName: name,
      ),
    ));
  }

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
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection('groups')
            .where('members', arrayContains: widget.currentUserUid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<QueryDocumentSnapshot> docs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                final doc = docs[index];
                final data = doc.data() as Map<String, dynamic>;
                return ListTile(
                  title: Text(data['name'] ?? ''),
                  subtitle: Text(data['description'] ?? ''),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChatScreen(
                        groupId: doc.id,
                        groupName: data['name'] ?? '',
                      ),
                    ));
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CreateGroupScreen(
              onCreateGroup: _createGroup,
            ),
          ));
        },
      ),
    );
  }
}

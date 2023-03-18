import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// specify the correct import statement

class ChatScreen extends StatefulWidget {
  final String groupId;
  final String groupName;

  ChatScreen({required this.groupId, required this.groupName});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.groupName),
        actions: [
          /*IconButton(
            icon: Icon(Icons.people),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MembersScreen(groupId: widget.groupId),
                ),
              );
            },
          ),*/
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('groups')
                  .doc(widget.groupId)
                  .collection('messages')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final List<QueryDocumentSnapshot> docs = snapshot.data!.docs;
                  return ListView.builder(
                    reverse: true,
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      final doc = docs[index];
                      final message = doc.data() as Map<String, dynamic>;
                      return ListTile(
                        title: Text(message['text'] ?? ''),
                        subtitle: Text(
                            message['sender']?.toString() ?? 'Unknown sender'),
                        trailing: Icon(Icons.check),
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
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () async {
                    final text = _textEditingController.text;
                    final sender = FirebaseAuth.instance.currentUser?.email;
                    if (text.isNotEmpty && sender != null) {
                      await _firestore
                          .collection('groups')
                          .doc(widget.groupId)
                          .collection('messages')
                          .add({
                        'text': text,
                        'sender': sender,
                        'timestamp': Timestamp.now(),
                      });
                      _textEditingController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MembersScreen extends StatefulWidget {
  final String groupId;

  MembersScreen({required this.groupId});

  @override
  _MembersScreenState createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Members'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc(widget.groupId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<dynamic> members = snapshot.data!['members'];
            return ListView.builder(
              itemCount: members.length,
              itemBuilder: (context, index) {
                final memberUid = members[index];
                return FutureBuilder<DocumentSnapshot>(
                  future: FirebaseFirestore.instance
                      .collection('users')
                      .doc(memberUid)
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final String email = snapshot.data!['email'];
                      return ListTile(
                        title: Text(email),
                      );
                    } else {
                      return ListTile(
                        title: Text('Loading...'),
                      );
                    }
                  },
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

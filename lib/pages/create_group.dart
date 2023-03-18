import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateGroupScreen extends StatefulWidget {
  final void Function(String groupName, String groupDescription) onCreateGroup;

  const CreateGroupScreen({Key? key, required this.onCreateGroup})
      : super(key: key);

  @override
  _CreateGroupScreenState createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  final TextEditingController _groupNameController = TextEditingController();
  final TextEditingController _tagController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool _isLoading = false;

  void _createGroup() async {
    setState(() {
      _isLoading = true;
    });
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String groupName = '';
      final groupNameText = _groupNameController.text.trim();
      if (groupNameText.isNotEmpty) {
        groupName = groupNameText;
        final tag = _tagController.text.trim();
        try {
          final newGroupRef = await _firestore.collection('groups').add({
            'name': groupName,
            'tag': tag,
            'createdBy': user.uid,
            'members': [user.uid],
          });
          final newGroupDoc = await newGroupRef.get();
          final data = newGroupDoc.data() as Map<String, dynamic>;
          groupName = data['name'] ?? '';
          final groupDescription = data['tag'] ?? '';
          widget.onCreateGroup(groupName, groupDescription);
          Navigator.of(context).pop();
        } catch (e) {
          print('Error creating group: $e');
          setState(() {
            _isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error creating group'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please enter a group name'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _groupNameController.dispose();
    _tagController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Group'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Group Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    controller: _groupNameController,
                    decoration: InputDecoration(
                      hintText: 'Enter group name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Tag (Optional)',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    controller: _tagController,
                    decoration: InputDecoration(
                      hintText: 'Enter group tag',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: _createGroup,
                    child: Text('Create Group'),
                  ),
                ],
              ),
            ),
    );
  }
}

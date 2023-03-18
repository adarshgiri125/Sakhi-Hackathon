import 'dart:convert';
import 'package:chatapp/pages/safetytips.dart';
import 'package:chatapp/pages/sakhihomepage.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import 'Articles.dart';
import 'ComplaintCounter.dart';
import 'constant.dart';
import 'package:http/http.dart' as http;

import 'courses.dart';
import 'helpline.dart';
import 'news.dart';

class chatbot extends StatelessWidget {
  const chatbot({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const chatty(title: 'Flutter Demo Home Page'),
    );
  }
}

class chatty extends StatefulWidget {
  const chatty({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<chatty> createState() => _chattyState();
}

class _chattyState extends State<chatty> {
  late bool isLoading;
  TextEditingController _textController = TextEditingController();
  final _scrollController = ScrollController();
  final List<ChatMessage> _messages = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = false;
  }

  Future<String> generateResponse(String prompt) async {
    final apiKey = apiSecKey;
    var url = Uri.https("api.openai.com", "/v1/completions");
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          'model': 'text-davinci-003',
          'prompt': prompt,
          'temperature': 0,
          'max_tokens': 2000,
          'top_p': 1,
          'frequency_penalty': 0.0,
          'presence_penalty': 0.0,
        }));
//decode response
    Map<String, dynamic> newresponse = jsonDecode(response.body);
    return newresponse['choices'][0]['text'];
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

    return SafeArea(
      // This method is rerun every time setState is called, for instance as done
      // by the _incrementCounter method above.
      //
      // The Flutter framework has been optimized to make rerunning build methods
      // fast, so that you can just rebuild anything that needs updating rather
      // than having to individually change instances of widgets.
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
        body: Column(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          children: [
            //chat body
            Expanded(
              child: _buildList(),
            ),
            Visibility(
              visible: isLoading,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  //input field
                  _buildInput(),
                  //submit button
                  _buildSubmit(),
                ],
              ),
            )
          ],
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  Expanded _buildInput() {
    return Expanded(
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        style: TextStyle(color: Colors.lightGreen, fontSize: 20),
        controller: _textController,
        decoration: InputDecoration(
          fillColor: Colors.blueGrey,
          filled: true,
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildSubmit() {
    return Visibility(
        visible: !isLoading,
        child: Container(
          color: Colors.grey[800],
          child: IconButton(
            icon: Icon(Icons.send_rounded),
            onPressed: () {
              //display user input
              setState(() {
                _messages.add(ChatMessage(
                    text: _textController.text,
                    chatMessageType: ChatMessageType.user));
                isLoading = true;
              });
              var input = _textController.text;
              _textController.clear();
              Future.delayed(Duration(milliseconds: 50))
                  .then((value) => _scrollDown());
              //call api
              generateResponse(input).then((value) {
                setState(() {
                  isLoading = false;
                  //display chatbot response
                  _messages.add(ChatMessage(
                      text: value, chatMessageType: ChatMessageType.bot));
                });
              });
              _textController.clear();
              Future.delayed(Duration(milliseconds: 50))
                  .then((value) => _scrollDown());
            },
          ),
        ));
  }

  void _scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  ListView _buildList() {
    return ListView.builder(
        itemCount: _messages.length,
        controller: _scrollController,
        itemBuilder: ((context, index) {
          var message = _messages[index];
          return ChatMessageWidget(
            text: message.text,
            chatMessageType: message.chatMessageType,
          );
        }));
  }
}

class ChatMessageWidget extends StatelessWidget {
  final String text;
  final ChatMessageType chatMessageType;
  const ChatMessageWidget(
      {super.key, required this.text, required this.chatMessageType});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            chatMessageType == ChatMessageType.bot
                ? Container(
                    margin: EdgeInsets.only(right: 16),
                    child: CircleAvatar(
                        backgroundColor: Color.fromRGBO(16, 163, 127, 1),
                        child: Icon(Icons.chat_bubble_outline_rounded)),
                  )
                : Container(
                    margin: EdgeInsets.only(right: 16),
                    child: CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                  ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Text(
                    text,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.black26),
                  ),
                )
              ],
            ))
          ],
        ));
  }
}

enum ChatMessageType { user, bot }

class ChatMessage {
  final String text;
  final ChatMessageType chatMessageType;
  ChatMessage({
    required this.text,
    required this.chatMessageType,
  });
}

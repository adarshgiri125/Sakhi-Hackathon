import 'package:chatapp/helper/helper_function.dart';
import 'package:chatapp/pages/auth/login_page.dart';
import 'package:chatapp/pages/home_page.dart';
import 'package:chatapp/pages/news.dart';
import 'package:chatapp/pages/safetytips.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import './shared/constants.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'pages/firebase_options.dart';

void main() async {
  AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests')
      ],
      debug: true);
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: Constants.apiKey,
            appId: Constants.appId,
            messagingSenderId: Constants.messagingSenderId,
            projectId: Constants.projectId));
  } else {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  }

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Constants().primaryColor,
          scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: _isSignedIn ? const HomePage() : const LoginPage(),
    );
  }
}

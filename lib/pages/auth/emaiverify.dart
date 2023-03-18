import 'package:chatapp/pages/auth/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailVerified extends StatefulWidget {
  const EmailVerified({Key? key}) : super(key: key);

  @override
  State<EmailVerified> createState() => _EmailVerifiedState();
}

class _EmailVerifiedState extends State<EmailVerified> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify Email Address')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "we've sent you a Email verifiaction. Please open it to very your Email Address",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              "Didn't get a verification Mail? Press the button below.",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () async {
                final user = FirebaseAuth.instance.currentUser;
                await user?.sendEmailVerification();
              },
              child: const Text('Send Email Verification Again'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: const Text('Registered? Login Here'),
            ),
            const SizedBox(height: 40),
            TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: const Text('Restart'),
            ),
          ],
        ),
      ),
    );
  }
}

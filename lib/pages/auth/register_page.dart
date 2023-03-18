import 'dart:html';
import 'dart:typed_data';

import 'package:chatapp/helper/helper_function.dart';
import 'package:chatapp/pages/auth/emaiverify.dart';
import 'package:chatapp/pages/auth/login_page.dart';
import 'package:chatapp/pages/home_page.dart';
import 'package:chatapp/service/auth_service.dart';
import 'package:chatapp/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'emaiverify.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String confirmPassword = "";
  String fullName = "";
  bool _isLoading = false;
  AuthService authService = AuthService();
  File? _file;
  Uint8List? _bytes;
  String? _error;
  bool _isLoadings = false;

  void _pickFile() {
    FileUploadInputElement uploadInput = FileUploadInputElement();
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final file = uploadInput.files!.first;
      final reader = FileReader();
      reader.readAsArrayBuffer(file);
      reader.onLoad.listen((event) {
        setState(() {
          _file = file;
          _bytes = reader.result as Uint8List?;
        });
      });
    });
  }

  void _uploadFile() async {
    setState(() {
      _isLoadings = true;
    });

    try {
      final folderName = email.replaceAll('@', '').replaceAll('.', '');
      final fileName = _file!.name;

      Reference storageReference =
          FirebaseStorage.instance.ref().child('$folderName/$fileName');
      UploadTask uploadTask = storageReference.putData(_bytes!);
      await uploadTask.whenComplete(() => print('File uploaded.'));
    } on FirebaseException catch (e) {
      setState(() {
        _error = e.message;
      });
    } finally {
      setState(() {
        _isLoadings = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor))
          : SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Sakhi",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "a friend in need is a friend in deed",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                      // Image.asset('assets/pic1.jpg'), // LoginImage
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                            labelText: "Full Name",
                            prefixIcon: Icon(
                              Icons.person,
                              color: Theme.of(context).primaryColor,
                            )),
                        onChanged: (val) {
                          setState((() {
                            fullName = val;
                          }));
                        },
                        validator: (val) {
                          if (val!.isNotEmpty) {
                            return null;
                          } else {
                            return "Please enter a your Full Name";
                          }
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                            labelText: "Email",
                            prefixIcon: Icon(
                              Icons.email,
                              color: Theme.of(context).primaryColor,
                            )),
                        onChanged: (val) => {
                          setState(() {
                            email = val;
                            // print("Email: $email");
                          })
                        },
                        validator: (val) {
                          return RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(val!)
                              ? null
                              : "Please enter a valid email";
                        },
                      ),

                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: textInputDecoration.copyWith(
                            labelText: "Password",
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Theme.of(context).primaryColor,
                            )),
                        validator: (val) {
                          if (val!.length < 6) {
                            return "Password must be at least 6 characters";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (val) => {
                          setState(() {
                            password = val;
                            // print("Password $password ");
                          })
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).primaryColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              )),
                          child: const Text(
                            "Register",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          onPressed: () {
                            register();
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text.rich(TextSpan(
                          text: "Already have an account? ",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text: "Login now",
                                style: const TextStyle(
                                    color: Colors.black,
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    nextScreen(context, const LoginPage());
                                  }),
                          ])),
                      SizedBox(height: 40.0),

                      // SizedBox(height: 16),
                      // ElevatedButton(
                      //   onPressed: _pickFile,
                      //   child: Text('Select File'),
                      // ),
                      // SizedBox(height: 16),
                      // _isLoading
                      //     ? CircularProgressIndicator()
                      //     : ElevatedButton(
                      //         onPressed: _file == null ? null : _uploadFile,
                      //         child: Text('Upload'),
                      //       ),
                      // if (_error != null) Text(_error!),
                      // SizedBox(height: 16.0),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService
          .registerUserWithEmailandPassword(fullName, email, password)
          .then((value) async {
        if (value == true) {
          // saving the shared preference state
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(email);
          await HelperFunctions.saveUserNameSF(fullName);

          final user = FirebaseAuth.instance.currentUser;
          await user?.sendEmailVerification();
          Navigator.push(
            // Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EmailVerified()),
          );
          // nextScreenReplace(context, const HomePage());
        } else {
          showSnackbar(context, Colors.red, value);
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
}

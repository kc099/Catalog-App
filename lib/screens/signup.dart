import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

// class extending dart <String> datatype.
// These methods can be called on strings used in this file.
extension ExtString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =  RegExp(r"^[a-zA-Z]");
    return nameRegExp.hasMatch(this);
  }
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const String id = 'registration_screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late String email;
  late String password;
  bool showSpinner = false;
  final GlobalKey<FormState> _key = GlobalKey();
  var url = Uri.http('192.168.0.154:8000', '/api/user/create/');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    child: const Icon(
                      Icons.chevron_left,
                      size: 36,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    const Flexible(
                      child: SizedBox(
                        height: 120.0,
                        child: Text('Factory', style: TextStyle(fontSize: 36,),)
                        // child: Image.asset('images/logo.jpg'),
                      ),
                    ),
                    Form(
                      key: _key,
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '*Required Company Name';
                                }
                                return null;
                              },
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Enter Company name', labelText: 'Company Name'),
                            ),
                            const SizedBox(height: 10.0),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '*Required Company Email';
                                } else if (!value.isValidEmail) {
                                  return '*Please enter valid Email';
                                }
                                return null;
                              },
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Enter Company Email', labelText: 'Company Email'),
                            ),
                            const SizedBox(height: 10.0),
                            TextFormField(
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '*GST cannot be empty';
                                }
                                return null;
                              },
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Enter GST', labelText: 'GST'),
                            ),
                            const SizedBox(height: 10.0),
                            TextFormField(
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '*Please Enter Street/Plot';
                                }
                                return null;
                              },
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Street No/Plot No', labelText: 'Street No/ Plot No'),
                            ),
                            const SizedBox(height: 10.0),
                            TextFormField(
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'City', labelText: 'City'),
                            ),
                            const SizedBox(height: 10.0),
                            TextFormField(
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'State', labelText: 'State'),
                            ),
                            const SizedBox(height: 10.0),
                            TextFormField(
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Pin code', labelText: 'Pin code'),
                            ),
                            const SizedBox(height: 15.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                                  child: Material(
                                    color: const Color(0xff21b409),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(30.0)),
                                    elevation: 5.0,
                                    child: MaterialButton(
                                      onPressed: () async {
                                        if (_key.currentState!.validate()) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                                content: Text('Processing Data')),
                                          );
                                          var response =
                                          await http.post(url, body: {});
                                          print(
                                              'Response status: ${response.statusCode}');
                                          print(
                                              'Response body: ${response.body}');
                                        }
                                      },
                                      minWidth: 200.0,
                                      height: 42.0,
                                      child: const Text(
                                        'Register',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


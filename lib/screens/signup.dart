import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/rounded_button.dart';
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
      appBar: AppBar(title: Text('Catalog App'), backgroundColor: Colors.deepPurpleAccent),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Form(
            key: _key,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[ TextFormField(
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '*Required Email';
                        }
                        return null;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter Company Email', labelText: 'Company Email'),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '*Required GST';
                        }
                        return null;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter GST Number', labelText: 'GST'),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '*Required Street No/ Plot No';
                        }
                        return null;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Street No/ Plot No', labelText: 'Street No/ Plot No'),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '*Required City';
                        }
                        return null;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter City', labelText: 'City'),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '*Required State';
                        }
                        return null;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter State', labelText: 'State'),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '*Required Pin code';
                        }
                        return null;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter Pin code', labelText: 'Pin code'),
                    ),
                    const SizedBox(height: 10.0),
                    RoundedButton(colour: const Color(0xff21b409), title: 'Register', onPressed: (){_key.currentState!.validate();}),
                  ],
                ),
              ),
            ),

          ),
        ),
      ),
    );
  }
}




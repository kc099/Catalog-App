import 'package:catalog/screens/home.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../screens/product_overview.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;
  final GlobalKey<FormState> _keyL = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Catalog App'),
          backgroundColor: Colors.deepPurpleAccent),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Center(
                    child: SizedBox(
                      height: 100.0,
                      child: Text(
                        'Factory Name',
                        style: TextStyle(
                          fontSize: 36,
                        ),
                      ),
                      // child: Image.asset('images/logo.jpg'),
                    ),
                  ),
                  Form(
                    key: _keyL,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 10.0),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '*Required Email';
                              }
                              return null;
                            },
                            decoration: kTextFieldDecoration.copyWith(
                                hintText: 'Enter Company email',
                                labelText: 'Company Email'),
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            obscureText: true,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '*Required password';
                              }
                              return null;
                            },
                            decoration: kTextFieldDecoration.copyWith(
                                hintText: 'Enter your password',
                                labelText: 'Password'),
                          ),
                          const SizedBox(height: 15.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: Material(
                                  color: const Color(0xf00a1cce),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30.0)),
                                  elevation: 5.0,
                                  child: MaterialButton(
                                    onPressed: () {
                                      if (_keyL.currentState!.validate()) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return const HomeScreen();
                                            },
                                          ),
                                        );
                                      }
                                    },
                                    minWidth: 200.0,
                                    height: 42.0,
                                    child: const Text(
                                      'Login',
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
          ],
        ),
      ),
    );
  }
}

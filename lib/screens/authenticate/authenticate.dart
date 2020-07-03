import 'package:better_call_noob/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:better_call_noob/screens/authenticate/register.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool flag = true;

  void togglePage() {
    setState(() {
      flag = !flag;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (flag) {
      return SignIn(toggle: togglePage);
    } else {
      return Register(toggle: togglePage);
    }
  }
}

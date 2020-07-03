import 'package:better_call_noob/services/auth.dart';
import 'package:flutter/material.dart';
import 'screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:better_call_noob/model/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

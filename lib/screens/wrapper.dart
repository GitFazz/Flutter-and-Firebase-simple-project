import 'package:better_call_noob/model/user.dart';
import 'package:better_call_noob/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:better_call_noob/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}

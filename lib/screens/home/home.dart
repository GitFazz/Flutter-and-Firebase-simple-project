import 'package:flutter/material.dart';
import 'package:better_call_noob/services/auth.dart';

class Home extends StatelessWidget {
  final _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[100],
      appBar: AppBar(
        title: Text('It\'s Showtime!'),
        backgroundColor: Colors.indigo,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async {
              await _authService.signOut();
            },
          ),
        ],
      ),
    );
  }
}

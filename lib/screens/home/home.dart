import 'package:better_call_noob/model/client.dart';
import 'package:better_call_noob/screens/home/client_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:better_call_noob/services/auth.dart';
import 'package:better_call_noob/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:better_call_noob/screens/home/add.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  final _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Client>>.value(
      value: Database().clientStream,
      child: Scaffold(
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
        body: ClientList(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_box),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Add()));
          },
        ),
      ),
    );
  }
}

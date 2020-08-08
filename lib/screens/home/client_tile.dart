import 'package:better_call_noob/model/client.dart';
import 'package:flutter/material.dart';

class ClientTile extends StatelessWidget {
  final Client client;

  ClientTile({this.client});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/one.jpg'),
            radius: 30,
           // backgroundColor: Colors.brown,
          ),
          title: Text(client.name),
          subtitle: Text(client.contact),
        ),
      ),
    );
  }
}

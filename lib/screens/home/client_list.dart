import 'package:better_call_noob/model/client.dart';
import 'package:better_call_noob/screens/home/client_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClientList extends StatefulWidget {
  @override
  _ClientListState createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<List<Client>>(context);

    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return ClientTile(client: data[index]);
      },
    );
  }
}

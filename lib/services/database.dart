import 'package:better_call_noob/model/client.dart';
import 'package:better_call_noob/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final CollectionReference client_collection =
      Firestore.instance.collection('clients');

  String uid;

  Database({this.uid});

  Future update_user_data(String name, String phone, int priority) async {
    return await client_collection
        .document(uid)
        .setData({'Name': name, 'Phone': phone, 'Priority': priority});
  }

  List<Client> _clientListFromSnapshots(QuerySnapshot snapshots) {
    return snapshots.documents
        .map((e) => Client(
            name: e.data['Name'] ?? '',
            contact: e.data['Phone'] ?? '',
            priority: e.data['Priority'] ?? '0'))
        .toList();
  }

  Stream<List<Client>> get clientStream {
    return client_collection.snapshots().map(_clientListFromSnapshots);
  }
}

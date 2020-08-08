import 'package:flutter/material.dart';

class Add extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Back to Home'),
      ),
      body: Container(
        color: Colors.amberAccent,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: 'Name',
                  hintText: 'Enter full name'),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                  icon: Icon(Icons.email),
                  labelText: 'E-mail',
                  hintText: 'Enter a valid name'),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('submit'),
            ),
          ],
        ),
      ),
    );
  }
}

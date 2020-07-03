import 'package:flutter/material.dart';
import 'package:better_call_noob/services/auth.dart';
import 'authenticate.dart';

class Register extends StatefulWidget {
  final Function toggle;

  Register({this.toggle});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email = '';
  String pass = '';
  String error = '';

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[200],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0.0,
        title: Text(
          'Sign up to Noobie for free.',
        ),
        actions: [
          RaisedButton(
            onPressed: () {
              widget.toggle();
            },
            child: Icon(Icons.arrow_back),
            color: Colors.blue[100],
          )
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter a valid e-mail',
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.greenAccent, width: 5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.amberAccent, width: 5.0),
                      ),
                    ),
                    validator: (val) =>
                        val.isEmpty ? 'Enter your e-mail' : null,
                    onChanged: (value) {
                      ///
                      setState(() {
                        email = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Choose a password of at least 6 characater',
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.greenAccent, width: 5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.amberAccent, width: 5.0),
                      ),
                    ),
                    validator: (val) => val.length < 4
                        ? 'Enter at least 4 digit Password'
                        : null,
                    obscureText: true,
                    onChanged: (value) {
                      ///
                      setState(() {
                        pass = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  RaisedButton(
                    color: Colors.amberAccent,
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.black),
                    ),

                    //for varification purpuse intentionaly made async
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        dynamic valid_user =
                            await _auth.register_with_email(email, pass);

                        if (valid_user == null) {
                          setState(() {
                            error = 'User sign up error!';
                          });
                        }
                      } else {
                        setState(() {
                          error = 'the username or password is not  valid';
                        });
                      }
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    '$error',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ))),
    );
  }
}

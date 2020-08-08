import 'package:better_call_noob/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:better_call_noob/design/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggle;

  SignIn({this.toggle});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool showLoading = false;

  String email = '';
  String pass = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return showLoading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.lightBlue[200],
            appBar: AppBar(
              backgroundColor: Colors.blueAccent,
              elevation: 0.0,
              title: Text(
                'Sign in to Noobie',
              ),
              actions: [
                RaisedButton(
                  onPressed: () {
                    widget.toggle();
                  },
                  child: Icon(Icons.person_add),
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
                            hintText: 'E-mail:',
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.greenAccent, width: 5.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.amberAccent, width: 5.0),
                            ),
                          ),
                          validator: (value) =>
                              (value.isEmpty) ? 'Enter your email' : null,
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
                            hintText: 'Password:',
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.greenAccent, width: 5.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.amberAccent, width: 5.0),
                            ),
                          ),
                          validator: (value) => (value.length < 4)
                              ? 'Password should be at least 4 char '
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
                            'Sign In',
                            style: TextStyle(color: Colors.black),
                          ),

                          //for varification purpuse intentionaly made async
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                showLoading = true;
                              });
                              dynamic result =
                                  await _auth.login_with_email(email, pass);

                              if (result == null) {
                                setState(() {
                                  showLoading = false;
                                  error = 'User not found in server';
                                });
                              }
                            } else {
                              setState(() {
                                error =
                                    'Username or password is not in correct format';
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

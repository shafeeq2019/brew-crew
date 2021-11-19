import 'package:brew_crew/models/appUser.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
  final Function? toggleView;
  SignIn({this.toggleView});
}

class _SignInState extends State<SignIn> {
  String email = '';
  String password = '';
  String error = '';
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to Brew Crew'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                widget.toggleView!();
              },
              icon: Icon(Icons.person),
              label: Text("Register"))
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Email'),
                    validator: (val) => val!.isEmpty ? 'enter an email' : null,
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration:
                        textInputDecoration.copyWith(hintText: 'Password'),
                    validator: (val) =>
                        val!.length < 6 ? 'enter a password 6+ long' : null,
                    obscureText: true,
                    onChanged: (val) {
                      password = val;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                      onPressed: () async {
                        if (_formkey.currentState!.validate()) {
                          dynamic result =
                              await AuthService.signInWithEmailAndPassword(
                                  email, password);
                          if (result == null) {
                            setState(() {
                              error =
                                  'could not sign in with those credentials';
                            });
                          }
                        }
                      },
                      color: Colors.pink[400],
                      child: Text(
                        'Sign in',
                        style: TextStyle(color: Colors.white),
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  )
                ],
              ))),
    );
  }
}

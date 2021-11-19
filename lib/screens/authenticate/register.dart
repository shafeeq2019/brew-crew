import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
  final Function? toggleView;
  Register({this.toggleView});
}

class _RegisterState extends State<Register> {
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
        title: Text('Sign up to Brew Crew'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                widget.toggleView!();
              },
              icon: Icon(Icons.person),
              label: Text("Sign in"))
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
                              await AuthService.registerWithEmailAndPassword(
                                  email, password);
                          if (result == null) {
                            setState(() {
                              error = 'Please supply a valid email';
                            });
                          }
                        }
                      },
                      color: Colors.pink[400],
                      child: Text(
                        'Register',
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

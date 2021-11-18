// ignore_for_file: deprecated_member_use

import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text("Brow Crew"),
        backgroundColor: Colors.brown[400],
        elevation: 0,
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                AuthService.logout();
              },
              icon: Icon(Icons.person),
              label: Text("Logout"))
        ],
      ),
    );
  }
}

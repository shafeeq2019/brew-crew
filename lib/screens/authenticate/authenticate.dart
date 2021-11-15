import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AuthService.singInAnon().then((value) {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Authenticate'),
    );
  }
}

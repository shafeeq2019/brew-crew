import 'package:brew_crew/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return either Home or Authenticate Widget
    return Authenticate();
  }
}

import 'package:brew_crew/models/appUser.dart';
import 'package:brew_crew/screens/home/home.dart';
import 'package:brew_crew/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // we specify what type of data we need so that the provider knows what stream to listen to
    final AppUser user = Provider.of<AppUser>(context);
    //return either Home or Authenticate Widget
    if (user.uid == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}

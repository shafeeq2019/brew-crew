import 'package:brew_crew/models/appUser.dart';
import 'package:brew_crew/screens/wrapper.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //make the AuthService().user accessable in all widgets under Wrapper

    return StreamProvider<AppUser>.value(
        initialData: AppUser(),
        value: AuthService().user,
        child: MaterialApp(home: Wrapper()));
  }
}

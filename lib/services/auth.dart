import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //_ private!
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in anonym
  static Future singInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sing with email and password

  // register with email and password

  // sign out
}

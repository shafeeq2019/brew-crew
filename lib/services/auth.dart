import 'package:brew_crew/models/appUser.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //_ private!
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  // auth change user stream
  Stream<AppUser> get user {
    return _auth.authStateChanges().map((event) {
      return AppUser(uid: event?.uid);
    });
  }

  // sign in anonym
  static Future singInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      AppUser user = AppUser(uid: result.user!.uid);
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sing with email and password
  static Future signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      AppUser user = AppUser(uid: result.user!.uid);
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register with email and password
  static Future registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      AppUser user = AppUser(uid: result.user!.uid);
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  static Future logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

import 'package:brew_crew/models/appUser.dart';
import 'package:brew_crew/models/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');
  final String? uid;
  DatabaseService({this.uid});

  Future updateUserData(String sugar, String name, int strenght) async {
    return await brewCollection
        .doc(uid)
        .set({'sugars': sugar, 'name': name, 'strenght': strenght});
  }

  // get brews stream
  Stream<List<Brew>?> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  // get user data stream
  Stream<UserData> get userData {
    return brewCollection.doc(uid).snapshots().map((v) {
      return _userDataFromSnapshot(v);
    });
  }

  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) {
      return Brew(
        name: e.get('name') ?? '',
        sugars: e.get('sugars') ?? '',
        strength: e.get('strenght') ?? '',
      );
    }).toList();
  }

  // userData from DocumentSnapshot
  _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: snapshot.get('uid') ?? '',
      name: snapshot.get('name') ?? '',
      sugars: snapshot.get('sugars') ?? '',
      strength: snapshot.get('strenght') ?? '',
    );
  }
}

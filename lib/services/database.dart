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

  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshots) {
    return snapshots.docs.map((e) {
      return Brew(
        name: e.get('name') ?? '',
        sugars: e.get('sugars') ?? '',
        strength: e.get('strenght') ?? '',
      );
    }).toList();
  }
}

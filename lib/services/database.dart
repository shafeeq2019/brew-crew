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
  Stream<QuerySnapshot> get brews {
    return brewCollection.snapshots();
  }
}

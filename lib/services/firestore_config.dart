import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreConfig {
  Future<void> addUserToFirestore(String uid, String username) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      await users.doc(uid).set({
        'username': username,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print(e);
    }
  }

  Future<String?> getUsername(String uid) async {
    try {
      DocumentSnapshot doc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      return doc['username'];
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> updateUsername(String uid, String newUsername) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      await users.doc(uid).update({'username': newUsername});
    } catch (e) {
      print(e);
    }
  }
}

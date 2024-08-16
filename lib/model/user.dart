import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String? uid;
  String? email;
  String? userName;

  User({this.uid, this.email, this.userName});

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'userName': userName,
      };

  factory User.fromData(Map<String, dynamic>? data) {
    if (data == null) {
      return User();
    }
    return User(
      uid: data['uid'],
      email: data['email'],
      userName: data['userName'],
    );
  }

  factory User.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return User(
      uid: data?['uid'],
      email: data?['email'],
      userName: data?['userName'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (uid != null) "uid": uid,
      if (email != null) "email": email,
      if (userName != null) "country": userName,
    };
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  String? email;
  String? userName;

  UserModel({this.uid, this.email, this.userName});

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'userName': userName,
      };

  factory UserModel.fromData(Map<String, dynamic>? data) {
    if (data == null) {
      return UserModel();
    }
    return UserModel(
      uid: data['uid'],
      email: data['email'],
      userName: data['userName'],
    );
  }

  factory UserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserModel(
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

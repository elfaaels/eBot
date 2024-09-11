import 'dart:developer';

import 'package:ebot/model/question.dart';
import 'package:ebot/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreConfig {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  Future<String>? addUserToFirestore(
      {String? uid, String? email, String? userName}) async {
    String returnValue = 'ERROR';
    try {
      await _firestore.collection("users").doc(uid).set({
        'uid': uid,
        'email': email,
        'userName': userName,
        'createdAt': FieldValue.serverTimestamp(),
      });
      returnValue = 'SUCCESS';
    } catch (e) {
      log(e.toString());
    }
    return returnValue;
  }

  // Future<User?> getUser(String uid) async {
  //   User? returnValue;

  //   try {
  //     DocumentSnapshot _docSnapshot =
  //         await _firestore.collection("users").doc(uid).get();
  //     returnValue = User.fromData(_docSnapshot.data() as Map<String, dynamic>);
  //   } catch (e) {
  //     print(e);
  //   }

  //   return returnValue;
  // }

  // Stream<QuerySnapshot> get usersCollection {
  //   return users.snapshots();
  // }

//   Future<User> getUserInfo(String uid) async {
//     User user = User();
//     try {
//       DocumentSnapshot _docSnapshot =
//           await _firestore.collection("users").doc(uid).get();
//       user.uid = uid;
//       user.email = _docSnapshot['email'];
//       user.userName = _docSnapshot['userName'];
//     } catch (e) {
//       print(e);
//     }
//     return user;
//   }
// }

  Future<String?> getUsername(String uid) async {
    try {
      DocumentSnapshot doc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      return doc['username'];
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }

  Future<void> updateUsername(String uid, String newUsername) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      await users.doc(uid).update({'username': newUsername});
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}

class DatabaseService {
  final String? uid;

  DatabaseService({this.uid});

  final CollectionReference questions =
      FirebaseFirestore.instance.collection('questions');

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  // List<Question> _questionListFromSnapshot(QuerySnapshot snapshot) {
  //   print(snapshot.docs.length);
  //   return snapshot.docs.map((doc) {
  //     print('print complaint docid ' + doc.id);
  //     return Question(
  //       id: doc.id,
  //     );
  //   }).toList();
  // }

  String? getCurrentUserId() {
    final user = FirebaseAuth.instance.currentUser;
    return user?.uid;
  }

  Future<UserModel> getUserData() {
    String? userId = getCurrentUserId();
    if (userId != null) {
      return FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: userId)
          .get()
          .then((snapshot) {
        return UserModel(
          uid: userId,
          email: snapshot.docs.first['email'],
        );
      });
    } else {
      return Future.value(UserModel());
    }
  }

  Stream<QuerySnapshot> getUserDataStream() {
    String? userId = getCurrentUserId();
    if (userId != null) {
      return FirebaseFirestore.instance
          .collection('questions')
          .where('uid', isEqualTo: userId)
          .snapshots();
    } else {
      // Handle the case when the user is not signed in
      return const Stream.empty();
    }
  }

  Future<List<Question>> getQuestionsForCurrentUser() async {
    String? userId = getCurrentUserId();

    if (userId == null) {
      return []; // Handle the case where the user is not authenticated
    }

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('questions')
        .where('user.uid', isEqualTo: userId)
        // .orderBy('createdAt', descending: true)
        .get();

    return querySnapshot.docs.map((doc) {
      return Question.fromMap(doc.data() as Map<String, dynamic>, doc.id);
    }).toList();
  }

  Stream<List<Question>> getQuestion() {
    String? userId = getCurrentUserId();
    return FirebaseFirestore.instance
        .collection('questions')
        .where('user.uid', isEqualTo: userId)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data();
        log("data: " + data.toString());
        return Question(
          id: doc.id,
          textQuestion: data['textQuestion'],
          answer: data['answer'],
          imageQuestion: data['imageQuestion'],
          imageUrl: data['imageUrl'],
          // user: UserModel.fromFirestore(snapshot,  null),
        );
      }).toList();
    });
  }

  deleteQuestion(String id) async {
    await questions.doc(id).delete();
    log('Question: deleted' + id);
  }

  UserModel? getCurrentUser() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return UserModel(
        uid: user.uid,
        email: user.email ?? '',
      );
    }
    return null;
  }

  Future<void> addQuestion({Question? question}) {
    CollectionReference questions =
        FirebaseFirestore.instance.collection('questions');
    UserModel? currentUser = getCurrentUser();

    return questions
        .add({
          'createdAt': question?.createdAt,
          'textQuestion': question?.textQuestion,
          'answer': question?.answer,
          'imageQuestion': question?.imageQuestion,
          'imageUrl': question?.imageUrl,
          'user': currentUser?.toFirestore(),
        })
        .then((value) => log("Question added successfully!"))
        .catchError((error) => log("Failed to add Question: $error"));
  }
}

import 'package:ebot/services/firestore_config.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth;

  AuthService(this._auth);

  Future<User?> register({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if (user != null) {
        await FirestoreConfig().addUserToFirestore(
          uid: user.uid,
          email: email,
          userName: username,
        );
      }
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        throw 'The account already exists for that email.';
      } else {
        throw e.message ?? 'An unknown error occurred.';
      }
    } catch (e) {
      print("ERROR" + e.toString());
      throw 'ERROR_REGISTER';
    }
  }

  Future<String?> login(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<void>? signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<String?> resetPassword({required String email}) async {
    String? message;

    await _auth
        .sendPasswordResetEmail(email: email)
        .then((value) => message = 'SUCCESS')
        .catchError((e) => message = 'ERROR_RESET_PASSWORD: ${e.toString()}');
    return message;
  }
}

import 'package:airplane/models/user_model.dart';
import 'package:airplane/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
    String hobby = ''
  }) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel user = UserModel(
        id: userCredential.user!.uid,
        email: email,
        name: name,
        hobby: hobby,
        balance: 280000000,
      );

      await UserService().setUser(user);
      return user;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      print(e.message);
      throw errorHandler(e);
    }
  }

  Future<UserModel> signIn({
    required String email,
    required String password
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel user = await UserService().getUserById(userCredential.user!.uid);
      return user;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      print(e.message);
      throw errorHandler(e);
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      print(e.code);
      print(e.message);
      throw errorHandler(e);
    }
  }

  String errorHandler(FirebaseAuthException e) {
    switch (e.code) {
      case 'unknown':
        return 'Please fill the required fields!';
      case 'invalid-email':
        return 'Please enter a valid email!';
      case 'email-already-in-use':
        return 'This email is unavailable. Try again with another email!';
      case 'weak-password':
        return e.message!;
      case 'network-request-failed':
        return 'No connection found. Please check your connection!';
      case 'wrong-password':
        return 'The password is invalid!';
      case 'user-not-found':
        return e.message!;
      default:
        return 'Error occured';
    }
  }
}

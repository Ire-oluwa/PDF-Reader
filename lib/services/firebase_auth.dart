import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:pdf_reader/model/user_model.dart';

class Auth {
  // intialise authentication
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  // firebase user taking in user credentials from User model after sign-up
  User? _firebaseUser(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User(user.email, user.uid);
  }

  // check if user is signed-in/out
  Stream<User?>? get user {
    return _firebaseAuth.authStateChanges().map(_firebaseUser);
  }

  Future<User?> firebaseSignUpWithEmailPassword(
      String email, String password) async {
    final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return _firebaseUser(result.user);
  }

  Future<User?> firebaseSignInWithEmailPassword(
      String email, String password) async {
    final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return _firebaseUser(result.user);
  }

  Future<void> logOut()async {
    return _firebaseAuth.signOut();
  }
}

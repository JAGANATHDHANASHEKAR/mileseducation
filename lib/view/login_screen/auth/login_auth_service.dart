import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

  Future<String> signIn({userName, password}) async {
    try {
      _firebaseAuth.signInWithEmailAndPassword(
        email: userName,
        password: password,
      );
      return "Login Succesful";
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }

  Future<String> signUp({userName, password}) async {
    try {
      _firebaseAuth.createUserWithEmailAndPassword(
        email: userName,
        password: password,
      );
      return "Sign Up Succesful";
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

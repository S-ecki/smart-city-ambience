import 'package:firebase_auth/firebase_auth.dart';

/**
 * 
 */
class AuthServcice {
  final FirebaseAuth _firebaseAuth;

  AuthServcice(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  /**
   * 
   */
  Future<String> signIn({String mail, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: mail, password: password);
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  /**
   * 
   */
  Future<String> signUp({String mail, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: mail, password: password);
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}

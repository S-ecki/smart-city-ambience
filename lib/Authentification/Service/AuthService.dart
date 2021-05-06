import 'package:firebase_auth/firebase_auth.dart';

enum FireBaseSignInResponse { Success, Failed }

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
  Future<FireBaseSignInResponse> signIn({String mail, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: mail, password: password);
      return FireBaseSignInResponse.Success;
    } on FirebaseAuthException catch (e) {
      return FireBaseSignInResponse.Failed;
    }
  }

  /**
   * 
   */
  Future<FireBaseSignInResponse> signUp({String mail, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: mail, password: password);
      return FireBaseSignInResponse.Success;
    } on FirebaseAuthException catch (e) {
      return FireBaseSignInResponse.Failed;
    }
  }
}

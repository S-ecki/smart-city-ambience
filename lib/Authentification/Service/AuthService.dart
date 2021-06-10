import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smart_city_ambience/Authentification/Service/responseTypes.dart';

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
      return FireBaseSignInResponse(
        enumResponse: EFireBaseSignInResponse.Success,
      );
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return FireBaseSignInResponse(
          enumResponse: EFireBaseSignInResponse.Failed,
          errorMessage: e.message);
    }
  }

  /**
   * 
   */
  Future<FireBaseSignInResponse> signUp({String mail, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: mail, password: password);
      return FireBaseSignInResponse(
        enumResponse: EFireBaseSignInResponse.Success,
      );
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return FireBaseSignInResponse(
          enumResponse: EFireBaseSignInResponse.Failed,
          errorMessage: e.message);
    }
  }

  /**
   * This code is copies by this website: 
   *  https://firebase.flutter.dev/docs/auth/social
   */
  Future<FireBaseSignInResponse> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);

    return FireBaseSignInResponse(
        enumResponse: EFireBaseSignInResponse.Success);
  }
}

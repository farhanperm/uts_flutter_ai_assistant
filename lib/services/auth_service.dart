import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // ---------------------------
  // LOGIN EMAIL & PASSWORD
  // ---------------------------
  Future<User?> signInWithEmailPassword(
      String email, String password) async {
    final credential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return credential.user;
  }

  // ---------------------------
  // REGISTER EMAIL & PASSWORD
  // ---------------------------
  Future<User?> registerWithEmailPassword(
      String email, String password) async {
    final credential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return credential.user;
  }

  // ---------------------------
  // LOGIN GOOGLE
  // ---------------------------
  Future<User?> signInWithGoogle() async {
    try {
      // Step 1: Trigger Google Sign-in
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      if (gUser == null) return null;

      // Step 2: Request Google Auth Details
      final GoogleSignInAuthentication gAuth =
          await gUser.authentication;

      // Step 3: Convert to Firebase Credential
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      // Step 4: Sign in to Firebase
      return (await _auth.signInWithCredential(credential)).user;

    } catch (e) {
      print("Google Sign-In ERROR: $e");
      return null;
    }
  }

  // ---------------------------
  // LOGOUT
  // ---------------------------
  Future<void> signOut() async {
    await _auth.signOut();
    await GoogleSignIn().signOut();
  }

  // ---------------------------
  // CEK USER LOGIN
  // ---------------------------
  Stream<User?> get authStateChanges => _auth.authStateChanges();
}
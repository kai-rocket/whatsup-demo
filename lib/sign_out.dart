import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<void> signOut(FirebaseAuth _auth, GoogleSignIn googleSignIn) async {
  await _auth.signOut();
  await googleSignIn.signOut();
}

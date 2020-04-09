import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/mockito.dart';
import 'package:whatsup_demo/sign_out.dart';

class FirebaseAuthMock extends Mock implements FirebaseAuth {}

class GoogleSignInMock extends Mock implements GoogleSignIn {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('Firebase Auth and Google sign out are called on sign out function',
      () async {
    // Mock Firebase Auth and Google Sign In
    final FirebaseAuthMock firebaseAuthMock = FirebaseAuthMock();
    final GoogleSignInMock googleSignInMock = GoogleSignInMock();

    // Call signOut()
    await signOut(firebaseAuthMock, googleSignInMock);

    // Verify that mocks were called
    verify(firebaseAuthMock.signOut()).called(1);
    verify(googleSignInMock.signOut()).called(1);
  });
}

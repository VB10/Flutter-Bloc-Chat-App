import 'package:firebase_auth/firebase_auth.dart';

import 'IAuthServices.dart';

class AuthServices extends IAuthService {
  final FirebaseAuth firebaseAuth;

  AuthServices({
    required this.firebaseAuth,
  });

  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  @override
  Future<String> signUp(String email, String password, String userName) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return "signed in";
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return "Error : ${e.message}";
    }
  }
}

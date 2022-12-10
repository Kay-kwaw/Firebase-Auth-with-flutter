import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasedemo/Screens/SignIn/signinscreen.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;



  Future signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

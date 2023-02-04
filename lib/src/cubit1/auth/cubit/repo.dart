//import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginfirebase/src/pages/login.dart';

class AuthRepo {
  loginWithEmailPasswrd(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return UserCredential;
    } catch (ex) {
      throw Exception(ex);
    }
  }

  registrationWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } catch (ex) {
      throw Exception(ex);
    }
  }
}

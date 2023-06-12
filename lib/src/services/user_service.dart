// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  Future<void> updateUser(String email, String password) async {
    try {
      const user = await FirebaseAuth.instance.currentUser;
      print(user)
    } on FirebaseAuthException {}
  }
}

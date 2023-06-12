import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthState with ChangeNotifier {
  User? user;

  void setUser(User userAuthentication) {
    user = userAuthentication;
    notifyListeners();
  }

  void logout() {
    user = null;
    notifyListeners();
  }
}

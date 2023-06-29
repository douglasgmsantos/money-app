import 'package:flutter/foundation.dart';
import 'package:money/src/domain/entities/user_entity.dart';

class AuthState with ChangeNotifier {
  UserEntity? user;

  void setUser(UserEntity userAuthentication) {
    user = userAuthentication;
    notifyListeners();
  }

  void logout() {
    user = null;
    notifyListeners();
  }
}

import 'package:money/src/domain/entities/user_entity.dart';

abstract class AuthenticationRepository {
  Future<(UserEntity?, String?)> signInWithEmailAndPassword(
      String email, String password);
  Future<bool> createUserWithEmailAndPassword(UserEntity user);
  Future<void> logout();
}

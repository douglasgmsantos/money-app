import 'package:money/src/domain/repositories/firebase_authentication_repository.dart';
import 'package:money/src/domain/entities/user_entity.dart';

class AuthenticateUserUseCase {
  final _authenticationRepository = FirebaseAuthenticationRepository();

  AuthenticateUserUseCase();

  Future<UserEntity?> authenticate(String email, String password) async {
    final user = await _authenticationRepository.signInWithEmailAndPassword(
        email, password);
    return user;
  }

  Future<bool> createUser(String name, String email, String password) async {
    final userEntity = UserEntity(name: name, email: email, password: password);
    return await _authenticationRepository
        .createUserWithEmailAndPassword(userEntity);
  }

  Future<void> logout() async {
    await _authenticationRepository.logout();
  }
}

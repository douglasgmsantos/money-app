import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:money/src/core/errors/failure.dart';
import 'package:money/src/data/respositories/authentication_repository.dart';
import 'package:money/src/domain/entities/user_entity.dart';

class FirebaseAuthenticationRepository implements AuthenticationRepository {
  final FirebaseAuth _authFirebaseDataSource = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  FirebaseAuthenticationRepository();

  @override
  Future<(UserEntity?, String?)> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final response = await _authFirebaseDataSource.signInWithEmailAndPassword(
          email: email, password: password);

      if (response.credential != null) {
        throw Failure("Não foi possível realizar a autenticação!");
      }

      final user = await _firebaseFirestore
          .collection(response.user!.uid)
          .doc("user")
          .get()
          .then((DocumentSnapshot doc) => doc.data() as Map<String, dynamic>);

      return (UserEntity.fromJson(user), null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return (null, 'Usuário ou senha não encontrado, tente novamente!');
      } else if (e.code == 'wrong-password') {
        return (null, 'Usuário ou senha não encontrado, tente novamente!');
      } else {
        return (null, 'Ocorreu um erro ao tentar logar, tente novamente!');
      }
    } catch (e) {
      return (null, 'Ocorreu um erro ao tentar logar, tente novamente!');
    }
  }

  @override
  Future<bool> createUserWithEmailAndPassword(UserEntity user) async {
    try {
      final response =
          await _authFirebaseDataSource.createUserWithEmailAndPassword(
              email: user.email!, password: user.password!);

      if (response.credential != null) {
        throw Failure("Não foi possível realizar a autenticação!");
      }

      final userEntity = UserEntity(
          uid: response.user?.uid,
          name: user.name,
          email: response.user?.email);

      await _firebaseFirestore
          .collection(response.user!.uid)
          .doc("user")
          .set(userEntity.toMap());

      return true;
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return false;
  }

  @override
  Future<void> logout() {
    return _authFirebaseDataSource.signOut();
  }
}

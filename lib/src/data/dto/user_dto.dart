import 'package:money/src/domain/entities/user_entity.dart';

class UserDTO extends UserEntity {
  @override
  String? uid;
  @override
  String? name;
  @override
  String? email;
  @override
  String? password;
  @override
  bool? isActive;

  @override
  DateTime? createdAt;
  @override
  DateTime? updatedAt;

  UserDTO(
      {this.uid,
      required this.email,
      required this.name,
      this.password,
      this.isActive = true,
      this.createdAt,
      this.updatedAt})
      : super(
            uid: uid,
            name: name,
            email: email,
            password: password,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt);

  @override
  Map<String, dynamic> userToMap(UserEntity user) {
    return {
      "uid": user.uid,
      "name": user.name,
      "email": user.email,
      "isActive": user.isActive,
      "createdAt": user.createdAt
    };
  }
}

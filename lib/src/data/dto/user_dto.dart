import 'package:money/src/domain/entities/user_entity.dart';

class UserDTO extends UserEntity {
  String? uid;
  String? name;
  String? email;
  String? password;
  bool? isActive;

  DateTime? createdAt;
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

  Map<String, dynamic> toMap(UserEntity user) {
    final map = {
      "uid": user.uid,
      "name": user.name,
      "email": user.email,
      "isActive": user.isActive,
      "createdAt": user.createdAt
    };

    return map;
  }
}

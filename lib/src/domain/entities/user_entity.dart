// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserEntity {
  String? uid;
  String? name;
  String? email;
  String? password;
  bool? isActive;

  DateTime? createdAt;
  DateTime? updatedAt;

  UserEntity(
      {this.uid,
      required this.name,
      required this.email,
      this.password,
      this.isActive = true,
      this.createdAt,
      this.updatedAt});

  @override
  String toString() {
    return 'UserEntity(uid: $uid, name: $name, email: $email, password: $password, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  UserEntity.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'isActive': isActive,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

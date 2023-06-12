class UserDTO {
  final String name;
  final int age;
  final String email;

  UserDTO({required this.name, required this.age, required this.email});

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      name: json['name'],
      age: json['age'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'email': email,
    };
  }
}

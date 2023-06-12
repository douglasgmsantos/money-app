class UserDTO {
  final String displayName;
  final String photoUrl;
  final int phoneNumber;

  UserDTO(
      {required this.displayName,
      required this.photoUrl,
      required this.phoneNumber});

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      displayName: json['displayName'],
      photoUrl: json['photoUrl'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'displayName': displayName,
      'photoUrl': photoUrl,
      'phoneNumber': phoneNumber,
    };
  }
}

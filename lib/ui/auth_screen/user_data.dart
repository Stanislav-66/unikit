class UserData {
  final String email;
  final String displayName;
  final String photoUrl;

  UserData({
    required this.email,
    required this.displayName,
    required this.photoUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      email: map['email'] ?? '',
      displayName: map['displayName'] ?? '',
      photoUrl: map['photoUrl'] ?? '',
    );
  }
}
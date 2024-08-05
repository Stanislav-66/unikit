import 'package:equatable/equatable.dart';

import '../entities/entities.dart';

class UserL extends Equatable {
  final String IdUser;
  final String Email;
  final String Name;

  const UserL({
    required this.IdUser,
    required this.Email,
    required this.Name,
  });

  static const empty = UserL(
    IdUser: '',
    Email: '',
    Name: '',
  );

  static UserL fromEntity(UserEntity entity) {
    return UserL(
      IdUser: entity.IdUser,
      Email: entity.Email,
      Name: entity.Name,
    );
  }

  UserL copyWith({
    String? IdUser,
    String? Email,
    String? Name,
  }) {
    return UserL(
      IdUser: IdUser ?? this.IdUser,
      Email: Email ?? this.Email,
      Name: Name ?? this.Name,
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      IdUser: IdUser,
      Email: Email,
      Name: Name
    );
  }

  factory UserL.fromMap(Map<String, dynamic> map) {
    return UserL(
      IdUser: map['IdUser'] ?? '',
      Email: map['Email'] ?? '',
      Name: map['Name'] ?? ''
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'IdUser': IdUser,
      'Email': Email,
      'Name' : Name,
    };
  }

  @override
  List<Object?> get props => [IdUser, Email, Name];
}
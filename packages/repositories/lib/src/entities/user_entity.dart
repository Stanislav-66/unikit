import 'package:equatable/equatable.dart';

class UserEntity extends Equatable
{
  final String IdUser;
  final String Email;
  final String Name;

  const UserEntity({
    required this.IdUser,
    required this.Email,
    required this.Name
  });

  static UserEntity fromDocument(Map<String, dynamic> doc)
  {
    return UserEntity(
        IdUser: doc["IdUser"],
        Email: doc["Email"],
        Name: doc["Name"]
    );
  }


  Map<String, Object?> toDocument()
  {
    return {
      'IdUser' : IdUser,
      'Email' : Email,
      'Name' : Name,
    };
  }


  @override
  List<Object?> get props => [IdUser, Email, Name];

}
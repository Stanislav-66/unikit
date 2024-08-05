part of 'auth_bloc.dart';

class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AutheticationChange extends AuthEvent {
  final User user;
  const AutheticationChange(this.user);
}

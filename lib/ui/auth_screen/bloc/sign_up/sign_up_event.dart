part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class SignUpRequired extends SignUpEvent {
  final UserL user;
  final String password;

  SignUpRequired(this.user, this.password);
}
class ResendEmailVerification extends SignUpEvent {}

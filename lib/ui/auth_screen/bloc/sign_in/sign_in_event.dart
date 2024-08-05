part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();
  @override
  List<Object?> get props => [];
}
class SignInRequired extends SignInEvent {
  final String email;
  final String password;
  const SignInRequired(this.email, this.password);

}
class SignOutRequired extends SignInEvent{

  const SignOutRequired();
}
class YandexSignInRequired extends SignInEvent {

}

class TelegramSignInRequired extends SignInEvent {}

class VKSignInRequired extends SignInEvent {}

class ResetPasswordRequired extends SignInEvent {
  final String email;

  const ResetPasswordRequired({required this.email});
}

class ChangeEmail extends SignInEvent {
  final String newEmail;
  final String password;

  const ChangeEmail({required this.newEmail, required this.password});
}

class ChangeNameEvent extends SignInEvent {
  final UserL newName;

  const ChangeNameEvent(this.newName);

  @override
  List<Object?> get props => [newName];
}

class AppStartedUser extends SignInEvent {}

class ExitUsers extends SignInEvent{}
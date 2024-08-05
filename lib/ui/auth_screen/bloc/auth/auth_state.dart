part of 'auth_bloc.dart';

enum AuthStatus {user, ghost, unknow}
class AuthState extends Equatable{
  final AuthStatus status;
  final User? user;

  const AuthState._({
    this.status = AuthStatus.unknow,
    this.user
  });
  const AuthState.unknow() : this._();

  const AuthState.user(User user) : this._(status: AuthStatus.user, user: user);

  const AuthState.ghost() : this._(status: AuthStatus.ghost);

  @override
  List<Object?> get props => [status, user];


}

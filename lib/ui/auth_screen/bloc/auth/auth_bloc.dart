import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_reposytory/user_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final UserRepository userRepository;
  late final StreamSubscription<User?> _subscription;

  AuthBloc({
    required this.userRepository
  }) : super(const AuthState.unknow()) {
    _subscription = userRepository.user.listen((user) {
      add(AutheticationChange(user!));
    });
    on<AutheticationChange>((event, emit) {
      if(event.user != null)
      {
        emit(AuthState.user(event.user));
      }
      else {
        emit(const AuthState.ghost());
      }

    });
  }
  @override
  Future<void> close()  {
    _subscription.cancel();
    return super.close();
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_login_yandex_updated/flutter_login_yandex.dart';

import 'package:user_reposytory/user_repository.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserRepository _userRepository;
  final FlutterLoginYandex _yandexAuth;
  String _token = "empty";
  UserL user = const UserL(IdUser: "", Email: "", Name: "");

  SignInBloc({
    required UserRepository userRepository,
    required FlutterLoginYandex yandexAuth,
  })  : _userRepository = userRepository,
        _yandexAuth = yandexAuth,
        super(SignInInitial()) {
    on<SignInRequired>(_onSignInRequired);
    on<AppStartedUser>(_onAppStartedUser);
    on<YandexSignInRequired>(_onYandexSignInRequired);
    on<ChangeNameEvent>(_onChangeNameEvent);
    on<ChangeEmail>(_onChangeEmail);
    on<ExitUsers>(_onExitUsers);
    on<ResetPasswordRequired>(_onResetPasswordRequired);
  }

  Future<void> _onSignInRequired(SignInRequired event, Emitter<SignInState> emit) async {
    emit(SignInProcess());
    try {
      final user = await _userRepository.signIn(event.email, event.password);
      print('SignInRequired event: Signed in user: $user'); // Debug output
      await _userRepository.saveUserInfo(user);
      emit(SignInSuccess(user));
    } on FirebaseAuthException catch (e) {
      emit(SignInFailure(message: e.code));
    } catch (e) {
      emit(SignInFailure(message: e.toString()));
    }
  }

  Future<void> _onAppStartedUser(AppStartedUser event, Emitter<SignInState> emit) async {
    try {
      final user = await _userRepository.getUserInfo();
      print('AppStartedUser event: Retrieved user: $user');

      if (user != null) {
        final userExists = await _userRepository.checkUserInFirebase(user);
        if (userExists) {
          emit(SignInSuccess(user));
        } else {
          await _userRepository.clearUserInfo();
          emit(SignInInitial());
        }
      } else {
        emit(SignInInitial());
      }
    } catch (e) {
      print('Error in AppStartedUser event: $e');
      emit(SignInInitial());
    }
  }

  Future<void> _onYandexSignInRequired(YandexSignInRequired event, Emitter<SignInState> emit) async {
    emit(SignInProcess());
    try {
      final result = await _yandexAuth.signIn();
      if (result != null) {
        _token = result['token'] as String;
        emit(SignInSuccess(user));
      } else {
        emit(const SignInFailure(message: 'Authorization cancelled'));
      }
    } catch (e) {
      emit(SignInFailure(message: e.toString()));
    }
  }

  Future<void> _onChangeNameEvent(ChangeNameEvent event, Emitter<SignInState> emit) async {
    emit(SignInProcess());
    try {
      await _userRepository.updateUserName(event.newName);
      emit(SignInSuccess(event.newName));
    } catch (e) {
      emit(SignInFailure(message: e.toString()));
    }
  }

  Future<void> _onChangeEmail(ChangeEmail event, Emitter<SignInState> emit) async {
    emit(SignInProcess());
    try {
      await _userRepository.changeEmail(event.newEmail, event.password);
      user = user.copyWith(Email: event.newEmail);
      await _userRepository.saveUserInfo(user);
      emit(SignInSuccess(user));
    } on FirebaseAuthException catch (e) {
      emit(SignInFailure(message: e.code));
    } catch (e) {
      emit(SignInFailure(message: e.toString()));
    }
  }

  Future<void> _onExitUsers(ExitUsers event, Emitter<SignInState> emit) async {
    emit(SignInProcess());
    try {
      await _userRepository.logOut();
      await _userRepository.clearUserInfo();
      emit(SignInInitial());
    } catch (e) {
      emit(const SignInFailure(message: 'Failed to clear user info'));
    }
  }

  Future<void> _onResetPasswordRequired(ResetPasswordRequired event, Emitter<SignInState> emit) async {
    emit(SignInProcess());
    try {
      await _userRepository.resetPassword(event.email);
      emit(ResetPasswordSuccess());
    } on FirebaseAuthException catch (e) {
      emit(ResetPasswordFailure(message: e.code));
    } catch (e) {
      emit(ResetPasswordFailure(message: e.toString()));
    }
  }
}

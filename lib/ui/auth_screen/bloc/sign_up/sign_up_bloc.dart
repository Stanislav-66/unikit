import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:user_reposytory/user_repository.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository _userRepository;

  SignUpBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(SignUpInitial()) {
    on<SignUpRequired>((event, emit) async {
      emit(SignUpProcess());
      try {
        UserL user = await _userRepository.signUp(event.user, event.password);
        await _userRepository.setUserData(user);

        bool isEmailVerified = await _userRepository.checkEmailVerification();
        if (isEmailVerified) {
          emit(SignUpSuccess());
        } else {
          emit(SignUpEmailNotVerified());
        }
      } catch (e) {
        emit(SignUpFailure());
      }
    });

    on<ResendEmailVerification>((event, emit) async {
      try {
        await _userRepository.resendEmailVerification();
        emit(EmailVerificationSent());
      } catch (e) {
        emit(SignUpFailure());
      }
    });
  }
}

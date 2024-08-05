import 'package:firebase_auth/firebase_auth.dart';

import '../user_repository.dart';


abstract class UserRepository{
  Stream<User?> get user;
  Future<UserL> signUp(UserL user, String password);
  Future<void> setUserData(UserL userL);
  Future<UserL> signIn(String email, String password);
  Future<void> logOut();
  Future<void> changeEmail(String newEmail, String password);
  Future<bool> checkEmailVerification();
  Future<void> resendEmailVerification();
  Future<void> resetPassword(String email);
  Future<void> saveUserInfo(UserL user);
  Future<UserL?> getUserInfo();
  Future<void> updateUserName(UserL user);
  Future<bool> checkUserInFirebase(UserL user);
  Future<void> clearUserInfo();
}
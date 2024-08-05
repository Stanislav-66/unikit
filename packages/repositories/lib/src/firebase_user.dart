import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';


class FireBaseUserRepository implements UserRepository {

  final FirebaseAuth _firebaseAuth;
  final userList = FirebaseFirestore.instance.collection("users");

  FireBaseUserRepository({
    FirebaseAuth? firebaseAuth
}) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;
  @override
  Future<void> setUserData(UserL userL) async {
    try {
      await userList
          .doc(userL.IdUser)
          .set(userL.toEntity().toDocument());
    } catch(e)
    {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> saveUserInfo(UserL user) async {
    final prefs = await SharedPreferences.getInstance();
    final userMap = user.toMap();
    await prefs.setString('user_data', json.encode(userMap));
    print('Saved user data: ${json.encode(userMap)}'); // Debug output
  }

  @override
  Future<UserL?> getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString('user_data');
    print('Retrieved user data: $userString'); // Debug output
    if (userString != null) {
      final userMap = json.decode(userString) as Map<String, dynamic>;
      return UserL.fromMap(userMap);
    }
    return null;
  }

  @override
  Future<void> clearUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_data');
  }
  Future<bool> checkUserInFirebase(UserL user) async {
    final userDoc = await FirebaseFirestore.instance.collection('users').doc(user.IdUser).get();
    return userDoc.exists;
  }

  @override
  Future<UserL> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;

      if (user != null) {
        return UserL(
          IdUser: user.uid,
          Email: user.email ?? '',
          Name: 'UserName'
        );
      } else {
        throw Exception('User not found');
      }
    } catch (e) {
      throw Exception('Error signing in: $e');
    }
  }

  Future<void> updateUserName(UserL user) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(user.IdUser).update({'Name': user.Name});
    } catch (e) {
      throw Exception('Failed to update user name: $e');
    }
  }


  Future<void> changeEmail(String newEmail, String password) async {
    User? user = _firebaseAuth.currentUser;
    if (user != null) {
      AuthCredential credential = EmailAuthProvider.credential(
        email: user.email!,
        password: password,
      );
      await user.reauthenticateWithCredential(credential);
      await user.verifyBeforeUpdateEmail(newEmail);
      await FirebaseFirestore.instance.collection('users').doc(user.uid).update({'Email': newEmail});
    }
  }


  Future<UserL> signUp(UserL userL, String password) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: userL.Email,
        password: password,
      );

      await user.user?.sendEmailVerification();

      userL = userL.copyWith(
        IdUser: user.user?.uid,
      );

      await FirebaseFirestore.instance.collection('users').doc(user.user?.uid).set({
        'IdUser': user.user?.uid,
        'Email': userL.Email,
        'Name' : userL.Name
      });

      return userL;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> resetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> resendEmailVerification() async {
    User? user = _firebaseAuth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  Future<bool> checkEmailVerification() async {
    User? user = _firebaseAuth.currentUser;
    await user?.reload();
    return user?.emailVerified ?? false;
  }

  @override
  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map((listener)
    {
      return listener;
    });
  }

  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }

}
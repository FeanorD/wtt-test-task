import 'package:wtt_test_task/models/app_user.dart';

abstract class AuthRepository {
  Stream<AppUser> get user;
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> signInWithGoogle();
  Future<void> signInWithFacebook();
  Future<void> signInWithInstagram();
  Future<void> signOut();
}
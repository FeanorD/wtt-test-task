import 'dart:async';

import 'package:uuid/uuid.dart';
import 'package:wtt_test_task/models/app_user.dart';
import 'package:wtt_test_task/repositories/auth/auth_repository.dart';

class FakeAuthRepository implements AuthRepository {
  final _controller = StreamController<AppUser>();

  @override
  Stream<AppUser> get user async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AppUser.empty();
    yield* _controller.stream;
  }

  @override
  Future<void> signInWithEmailAndPassword(
      String email,
      String password,
  ) async {
    await Future<void>.delayed(const Duration(seconds: 1), () {
      _controller.add(AppUser(id: Uuid().v4(), email: email));
    });
  }

  @override
  Future<void> signInWithGoogle() async {
    await Future<void>.delayed(const Duration(seconds: 1), () {
      _controller.add(AppUser(id: Uuid().v4(), email: 'googleUser'));
    });
  }

  @override
  Future<void> signInWithFacebook() async {
    await Future<void>.delayed(const Duration(seconds: 1), () {
      _controller.add(AppUser(id: Uuid().v4(), email: 'facebookUser'));
    });
  }

  @override
  Future<void> signInWithInstagram() async {
    await Future<void>.delayed(const Duration(seconds: 1), () {
      _controller.add(AppUser(id: Uuid().v4(), email: 'instagramUser'));
    });
  }

  @override
  Future<void> signOut() async {
    await Future<void>.delayed(const Duration(seconds: 1), () {
      _controller.add(AppUser.empty());
    });
    print('logged out');
  }

  void dispose() => _controller.close();
}
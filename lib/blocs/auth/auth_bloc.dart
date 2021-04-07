import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:wtt_test_task/models/app_user.dart';
import 'package:wtt_test_task/repositories/auth/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    @required AuthRepository authRepository,
  }) : _authRepository = authRepository,
       super(AuthState.unknown()) {
    _userSubscription = _authRepository.user.listen((user) {
      add(AuthUserChanged(user));
    });
  }

  final AuthRepository _authRepository;
  StreamSubscription<AppUser> _userSubscription;

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthUserChanged) {
      yield _mapAuthUserChangedToState(event);
    } else if (event is AuthSignInRequested) {
      await _authRepository.signInWithEmailAndPassword(
        event.email,
        event.password,
      );
    } else if (event is SocialAuthRequested) {
      await _chooseSocialAuth(event);
    } else if (event is AuthUserSignedOut) {
      await _authRepository.signOut();
    }
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }

  AuthState _mapAuthUserChangedToState(
    AuthUserChanged event,
  ) {
    return event.user == AppUser.empty()
        ? AuthState.unauthenticated()
        : AuthState.authenticated(event.user);
  }

  Future<void> _chooseSocialAuth(
    SocialAuthRequested event,
  ) async {
    switch (event.socialNetwork) {
      case SocialNetwork.google:
        await _authRepository.signInWithGoogle();
        break;
      case SocialNetwork.facebook:
        await _authRepository.signInWithFacebook();
        break;
      case SocialNetwork.instagram:
        await _authRepository.signInWithInstagram();
    }
  }
}

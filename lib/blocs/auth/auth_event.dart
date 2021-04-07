part of 'auth_bloc.dart';

enum SocialNetwork {
  google,
  facebook,
  instagram,
}

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthUserChanged extends AuthEvent {
  const AuthUserChanged(this.user);

  final AppUser user;

  @override
  List<Object> get props => [user];
}

class AuthSignInRequested extends AuthEvent {
  const AuthSignInRequested({
    @required this.email,
    @required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

class SocialAuthRequested extends AuthEvent {
  const SocialAuthRequested({
    @required this.socialNetwork,
  });

  final SocialNetwork socialNetwork;

  @override
  List<Object> get props => [socialNetwork];
}

class AuthUserSignedOut extends AuthEvent {}

part of 'auth_bloc.dart';

enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
}

class AuthState extends Equatable {
  const AuthState._({
    this.status = AuthStatus.unknown,
    this.user = const AppUser.empty(),
  });

  const AuthState.unknown() : this._();

  const AuthState.authenticated(AppUser user) : this._(
    status: AuthStatus.authenticated,
    user: user,
  );

  const AuthState.unauthenticated() : this._(
    status: AuthStatus.unauthenticated,
  );

  final AuthStatus status;
  final AppUser user;

  @override
  List<Object> get props => [status, user];
}

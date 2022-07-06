part of 'auth_service.dart';

@immutable
class AuthServiceState {
  final bool isAuth;

  const AuthServiceState({
    this.isAuth = false,
  });

  AuthServiceState copyWith({
    bool? isAuth,
  }) {
    return AuthServiceState(
      isAuth: isAuth ?? this.isAuth,
    );
  }
}

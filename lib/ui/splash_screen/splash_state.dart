part of 'splash_bloc.dart';

@immutable
class SplashState {
  final bool isAuth;

  const SplashState({
    this.isAuth = true,
  });

  SplashState copyWith({
    bool? isAuth,
  }) {
    return SplashState(
      isAuth: isAuth ?? this.isAuth,
    );
  }
}

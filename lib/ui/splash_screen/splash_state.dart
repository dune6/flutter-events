part of 'splash_view_model.dart';

@immutable
class SplashState {
  final bool isAuth;

  const SplashState({
    required this.isAuth,
  });

  SplashState copyWith({
    bool? isAuth,
  }) {
    return SplashState(
      isAuth: isAuth ?? this.isAuth,
    );
  }
}

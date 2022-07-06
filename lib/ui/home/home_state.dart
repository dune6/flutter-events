part of 'home_bloc.dart';

@immutable
class HomeState {
  final bool isAuth;

  const HomeState({required this.isAuth});

  HomeState copyWith({
    bool? isAuth,
  }) {
    return HomeState(
      isAuth: isAuth ?? this.isAuth,
    );
  }
}

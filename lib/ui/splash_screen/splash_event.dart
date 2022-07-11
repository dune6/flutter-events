part of 'splash_bloc.dart';

@immutable
abstract class SplashEvent {}

class SplashCheckAuth extends SplashEvent {}

class ChangeAuthSplash extends SplashEvent {}

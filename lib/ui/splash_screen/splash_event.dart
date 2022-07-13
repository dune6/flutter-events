part of 'splash_view_model.dart';

@immutable
abstract class SplashEvent {}

class SplashCheckAuth extends SplashEvent {}

class ChangeAuthSplash extends SplashEvent {}

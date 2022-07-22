part of 'account_view_model.dart';

@immutable
abstract class AccountEvent {}

class AccountLogoutEvent extends AccountEvent {}

class AccountGetUserEvent extends AccountEvent {}

class UpdateAgeEvent extends AccountEvent {
  final int age;

  UpdateAgeEvent({required this.age});
}

class UpdateGenderEvent extends AccountEvent {
  final String gender;

  UpdateGenderEvent({required this.gender});
}

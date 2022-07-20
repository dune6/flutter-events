part of 'account_view_model.dart';

@immutable
abstract class AccountEvent {}

class AccountLogoutEvent extends AccountEvent {}

class AccountGetUserEvent extends AccountEvent {}

class UpdateAgeEvent extends AccountEvent {}

class UpdateGenderEvent extends AccountEvent {}

class UpdateTelegramEvent extends AccountEvent {}

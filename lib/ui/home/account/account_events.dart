part of 'account_bloc.dart';

@immutable
abstract class AccountEvent {}

class AccountLogoutEvent extends AccountEvent {}
class AccountGetUserEvent extends AccountEvent {}

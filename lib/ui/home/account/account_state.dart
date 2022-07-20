part of 'account_view_model.dart';

@immutable
class AccountState {
  final bool isAuth;
  final UserModel userModel;

  const AccountState({required this.isAuth, required this.userModel});

  AccountState copyWith({
    bool? isAuth,
    UserModel? userModel,
  }) {
    return AccountState(
      isAuth: isAuth ?? this.isAuth,
      userModel: userModel ?? this.userModel,
    );
  }
}

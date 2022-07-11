// уровень UI, ViewModel
class UserModel {
  UserModel({
    required this.login,
    required this.email,
    required this.password,
    this.years = 0,
    this.gender = '',
    this.telegram = '',
  });

  UserModel.emptyUser({
    this.login = '',
    this.email = '',
    this.password = '',
    this.years = 0,
    this.gender = '',
    this.telegram = '',
  });

  final String login;
  final String email;
  final String password;
  final int years;
  final String gender;
  final String telegram;
}

// сущность уровня базы данных
class UserEntity {
  UserEntity({
    this.id,
    required this.login,
    required this.email,
    required this.password,
    this.years = 0,
    this.gender = '',
    this.telegram = '',
  });

  final int? id;
  final String login;
  final String email;
  final String password;
  final int years;
  final String gender;
  final String telegram;
}
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

  static UserEntity userEntityFromMap(Map<String, dynamic> json) => UserEntity(
        id: json["id"],
        login: json["login"],
        email: json["email"],
        password: json["password"],
        years: json["years"],
        gender: json["gender"],
        telegram: json["telegram"],
      );

  static Map<String, dynamic> userEntityToMap(UserEntity user) => {
        "id": user.id,
        "login": user.login,
        "email": user.email,
        "password": user.password,
        "years": user.years,
        "gender": user.gender,
        "telegram": user.telegram,
      };
}

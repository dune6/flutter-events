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

  static UserModel userModelFromMap(Map<String, dynamic> json) => UserModel(
        login: json["login"],
        email: json["email"],
        password: json["password"],
        years: json["years"],
        gender: json["gender"],
        telegram: json["telegram"],
      );

  static Map<String, dynamic> userModelToMap(UserModel user) => {
        "login": user.login,
        "email": user.email,
        "password": user.password,
        "years": user.years,
        "gender": user.gender,
        "telegram": user.telegram,
      };
}

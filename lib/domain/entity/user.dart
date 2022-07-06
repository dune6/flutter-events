import 'dart:convert';

User userFromJson(String str) => User.fromMap(json.decode(str));

String userToJson(User data) => json.encode(data.toMap());

class User {
  User({
    required this.login,
    required this.email,
    required this.password,
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

  factory User.fromMap(Map<String, dynamic> json) => User(
        login: json["login"],
        email: json["email"],
        password: json["password"],
        years: json["years"],
        gender: json["gender"],
        telegram: json["telegram"],
      );

  Map<String, dynamic> toMap() => {
        "login": login,
        "email": email,
        "password": password,
        "years": years,
        "gender": gender,
        "telegram": telegram,
      };
}

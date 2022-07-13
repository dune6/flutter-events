import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_events/domain/entity/event/event_model.dart';

part 'user_model.g.dart';

// уровень UI, ViewModel
@JsonSerializable()
class UserModel {
  UserModel({
    required this.login,
    required this.email,
    required this.password,
    this.years = 0,
    this.gender = '',
    this.telegram = '',
    this.personalEvents = const [],
  });

  UserModel.emptyUser({
    this.login = '',
    this.email = '',
    this.password = '',
    this.years = 0,
    this.gender = '',
    this.telegram = '',
    this.personalEvents = const [],
  });

  @JsonKey(name: 'login')
  final String login;
  final String email;
  final String password;
  final int years;
  final String gender;
  final String telegram;
  final List<EventModel> personalEvents;

  static UserModel userModelFromMap(Map<String, dynamic> json) => UserModel(
        login: json["login"],
        email: json["email"],
        password: json["password"],
        years: json["years"],
        gender: json["gender"],
        telegram: json["telegram"],
        personalEvents: json["personalEvents"],
      );

  static Map<String, dynamic> userModelToMap(UserModel user) => {
        "login": user.login,
        "email": user.email,
        "password": user.password,
        "years": user.years,
        "gender": user.gender,
        "telegram": user.telegram,
        "personalEvents": user.personalEvents
      };

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

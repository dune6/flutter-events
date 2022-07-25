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
    this.personalEvents = const [],
  });

  UserModel.emptyUser({
    this.login = '',
    this.email = '',
    this.password = '',
    this.years = 0,
    this.gender = '',
    this.personalEvents = const [],
  });

  @JsonKey(name: 'login')
  final String login;
  final String email;
  final String password;
  final int years;
  final String gender;
  final List<EventModel> personalEvents;

  static UserModel userModelFromMap(Map<String, dynamic> json) => UserModel(
        login: json["login"],
        email: json["email"],
        password: json["password"],
        years: json["years"],
        gender: json["gender"],
        personalEvents: json["personalEvents"],
      );

  static Map<String, dynamic> userModelToMap(UserModel user) => {
        "login": user.login,
        "email": user.email,
        "password": user.password,
        "years": user.years,
        "gender": user.gender,
        "personalEvents": user.personalEvents
      };

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel copyWith({
    String? login,
    String? email,
    String? password,
    int? years,
    String? gender,
    String? telegram,
    List<EventModel>? personalEvents,
  }) {
    return UserModel(
      login: login ?? this.login,
      email: email ?? this.email,
      password: password ?? this.password,
      years: years ?? this.years,
      gender: gender ?? this.gender,
      personalEvents: personalEvents ?? this.personalEvents,
    );
  }
}

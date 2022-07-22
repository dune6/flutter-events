import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

// сущность уровня базы данных
@JsonSerializable()
class UserEntity {
  UserEntity({
    this.id,
    required this.login,
    required this.email,
    required this.password,
    this.years = 0,
    this.gender = '',
    this.jsonPersonalEvents = '',
  });

  final int? id;
  final String login;
  final String email;
  final String password;
  final int years;
  final String gender;
  final String jsonPersonalEvents;

  UserEntity copyWith({
    int? id,
    String? login,
    String? email,
    String? password,
    int? years,
    String? gender,
    String? jsonPersonalEvents,
  }) {
    return UserEntity(
      id: id ?? this.id,
      login: login ?? this.login,
      email: email ?? this.email,
      password: password ?? this.password,
      years: years ?? this.years,
      gender: gender ?? this.gender,
      jsonPersonalEvents: jsonPersonalEvents ?? this.jsonPersonalEvents,
    );
  }

  static UserEntity userEntityFromMap(Map<String, dynamic> json) => UserEntity(
      id: json["id"],
      login: json["login"],
      email: json["email"],
      password: json["password"],
      years: json["years"],
      gender: json["gender"],
      jsonPersonalEvents: json["jsonPersonalEvents"]);

  static Map<String, dynamic> userEntityToMap(UserEntity user) => {
        "id": user.id,
        "login": user.login,
        "email": user.email,
        "password": user.password,
        "years": user.years,
        "gender": user.gender,
        "jsonPersonalEvents": user.jsonPersonalEvents,
      };

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}

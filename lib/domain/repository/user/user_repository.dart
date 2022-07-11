import 'package:flutter_events/domain/entity/user/user_model.dart';

import '../../entity/user/user_entity.dart';

class UserRepository {
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

  static UserModel userEntityToUserModel(UserEntity userEntity) {
    return UserModel(
        login: userEntity.login,
        email: userEntity.email,
        password: userEntity.password,
        years: userEntity.years,
        gender: userEntity.gender,
        telegram: userEntity.telegram);
  }

// for UserResponse
// String userToJson(UserEntity user) => json.encode(userEntityToMap(user));
//
// UserModel userFromJson(String str) => fromMap(json.decode(str));

}

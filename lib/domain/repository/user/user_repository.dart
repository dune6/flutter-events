import 'package:flutter_events/domain/entity/user/user_model.dart';

import '../../entity/user/user_entity.dart';

class UserRepository {
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

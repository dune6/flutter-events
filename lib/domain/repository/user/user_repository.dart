import 'dart:convert';

import 'package:flutter_events/domain/entity/event/event_entity.dart';
import 'package:flutter_events/domain/entity/user/user_entity.dart';
import 'package:flutter_events/domain/entity/user/user_model.dart';
import 'package:flutter_events/domain/repository/events/evets_repository.dart';

class UserRepository {
  static UserModel userEntityToUserModel(UserEntity userEntity) {
    return UserModel(
      login: userEntity.login,
      email: userEntity.email,
      password: userEntity.password,
      years: userEntity.years,
      gender: userEntity.gender,
      telegram: userEntity.telegram,
      personalEvents:
          (jsonDecode(userEntity.jsonPersonalEvents) as List<dynamic>)
              .map((e) => EventRepository.eventEntityToEventModel(
                  EventEntity.fromJson(e as Map<String, dynamic>)))
              .toList(),
    );
  }

  static UserEntity userModelToUserEntity(UserModel userModel) {
    return UserEntity(
      login: userModel.login,
      email: userModel.email,
      password: userModel.password,
      years: userModel.years,
      gender: userModel.gender,
      telegram: userModel.telegram,
      jsonPersonalEvents: jsonEncode(userModel.personalEvents),
    );
  }
}

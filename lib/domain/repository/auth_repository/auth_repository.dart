import 'dart:async';

import 'package:flutter_events/domain/data/auth_data/database_crud_provider.dart';
import 'package:flutter_events/domain/data/auth_data/session_provider.dart';
import 'package:flutter_events/domain/entity/event/event_model.dart';
import 'package:flutter_events/domain/entity/user/user_entity.dart';
import 'package:flutter_events/domain/entity/user/user_model.dart';
import 'package:flutter_events/domain/entity/user/user_transformer.dart';
import 'package:flutter_events/exceptions/auth_exception.dart';

class AuthRepository {
  final SessionDataProvider sessionDataProvider;
  final DatabaseCrudProvider dbProvider;

  AuthRepository({required this.sessionDataProvider, required this.dbProvider});

  Future<UserEntity> currentUser() async {
    return await dbProvider
        .getUserByLogin(await sessionDataProvider.getUserLogin());
  }

  Future<String> checkAuth() async {
    return await sessionDataProvider.getUserLogin();
  }

  Future<void> login(String login, String password) async {
    final user = await dbProvider.getUserByLogin(login);
    if (user.password == password) {
      await sessionDataProvider.saveLoginKey(login);
    } else {
      throw LoginPasswordsException();
    }
  }

  Future<void> registrationUser(
      String login, String email, String password) async {
    await dbProvider.addUser(UserRepository.userModelToUserEntity(
            UserModel(login: login, email: email, password: password))
        .toJson());
  }

  Future<void> logout() async {
    await sessionDataProvider.clearLoginKey();
  }

  Future<void> updateUserInfo(UserModel userModel) async {
    var userEntityFromDB = await dbProvider.getUserByLogin(userModel.login);
    final userEntityFromModel = UserRepository.userModelToUserEntity(userModel);
    userEntityFromDB = userEntityFromDB.copyWith(
        jsonPersonalEvents: userEntityFromModel.jsonPersonalEvents,
        years: userEntityFromModel.years,
        gender: userEntityFromModel.gender);
    await dbProvider.updateUser(userEntityFromDB.toJson());
  }

  Future<void> addEventToFavourite(EventModel eventModel) async {
    final userEntity = await currentUser();
    final userModel = UserRepository.userEntityToUserModel(userEntity);
    if (!userModel.personalEvents.contains(eventModel)) {
      userModel.personalEvents.add(eventModel);
      await updateUserInfo(userModel);
    } else {}
  }
}

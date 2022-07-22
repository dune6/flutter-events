import 'dart:async';

import 'package:flutter_events/domain/data/auth_data/database_repository.dart';
import 'package:flutter_events/domain/data/auth_data/session_provider.dart';
import 'package:flutter_events/domain/entity/event/event_model.dart';
import 'package:flutter_events/domain/entity/user/user_entity.dart';
import 'package:flutter_events/domain/entity/user/user_model.dart';
import 'package:flutter_events/domain/repository/user/user_repository.dart';
import 'package:flutter_events/exceptions/auth_exception.dart';

class AuthService {
  final SessionDataProvider sessionDataProvider;
  final DBRepository dbRepository;

  AuthService({required this.sessionDataProvider, required this.dbRepository});

  Future<UserEntity> currentUser() async {
    return await dbRepository
        .getUserByLogin(await sessionDataProvider.getUserLogin());
  }

  Future<String> checkAuth() async {
    return await sessionDataProvider.getUserLogin();
  }

  Future<void> login(String login, String password) async {
    final user = await dbRepository.getUserByLogin(login);
    if (user.password == password) {
      await sessionDataProvider.saveLoginKey(login);
    } else {
      throw LoginPasswordsException();
    }
  }

  Future<void> registrationUser(
      String login, String email, String password) async {
    await dbRepository.addUser(UserRepository.userModelToUserEntity(
            UserModel(login: login, email: email, password: password))
        .toJson());
  }

  Future<void> logout() async {
    await sessionDataProvider.clearLoginKey();
  }

  Future<void> updateUserInfo(UserModel userModel) async {
    var userEntityFromDB = await dbRepository.getUserByLogin(userModel.login);
    final userEntityFromModel = UserRepository.userModelToUserEntity(userModel);
    userEntityFromDB = userEntityFromDB.copyWith(
        jsonPersonalEvents: userEntityFromModel.jsonPersonalEvents,
        years: userEntityFromModel.years,
        gender: userEntityFromModel.gender);
    await dbRepository.updateUser(userEntityFromDB.toJson());
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

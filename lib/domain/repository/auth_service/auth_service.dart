import 'dart:async';

import 'package:flutter_events/domain/data/auth_data/database_repository.dart';
import 'package:flutter_events/domain/data/auth_data/session_provider.dart';
import 'package:flutter_events/domain/entity/user/user_entity.dart';
import 'package:flutter_events/domain/entity/user/user_model.dart';
import 'package:flutter_events/exceptions/auth_exception.dart';

/*
  Сервис для работы с репозиториями
 */
class AuthService {
  final _sessionDataProvider = SessionDataProvider();
  final _dbRepository = DBRepository();

  Future<UserEntity> getUserByApiKey() async {
    return await _dbRepository
        .getUserByLogin(await _sessionDataProvider.apiKey());
  }

  Future<String> checkAuth() async {
    return await _sessionDataProvider.apiKey();
  }

  Future<void> login(String login, String password) async {
    final user = await _dbRepository.getUserByLogin(login);
    if (user.password == password) {
      await _sessionDataProvider.saveApiKey(login);
    } else {
      throw LoginPasswordsException();
    }
  }

  Future<void> registrationUser(
      String login, String email, String password) async {
    await _dbRepository.addUser(UserModel.userModelToMap(
        UserModel(login: login, email: email, password: password)));
  }

  Future<void> logout() async {
    await _sessionDataProvider.clearApiKey();
  }
}

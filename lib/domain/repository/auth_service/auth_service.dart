import 'dart:async';

import 'package:flutter_events/domain/data/auth_data/database_repository.dart';
import 'package:flutter_events/domain/data/auth_data/session_api_provider.dart';
import 'package:flutter_events/domain/entity/user_entity.dart';
import 'package:flutter_events/domain/entity/user_model.dart';
import 'package:flutter_events/domain/repository/user/user_repository.dart';

import '../../../exceptions/auth_exception.dart';

/*
  Сервис для работы с репозиториями
 */
class AuthService {
  final _sessionDataProvider = SessionDataProvider();
  final _dbRepository = DBRepository();

  Future<UserEntity> getLastUser() async {
    return await _dbRepository.getLastUser();
  }

  Future<bool> checkAuth() async {
    final apiKey = await _sessionDataProvider.apiKey();
    if (apiKey != null) {
      return true;
    } else {
      return false;
    }
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
    await _dbRepository.addUser(UserRepository.userModelToMap(
        UserModel(login: login, email: email, password: password)));
  }

  Future<void> logout() async {
    await _sessionDataProvider.clearApiKey();
  }
}

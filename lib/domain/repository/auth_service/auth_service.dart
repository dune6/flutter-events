import 'dart:async';

import 'package:flutter_events/domain/data/auth_data/auth_api_provider.dart';
import 'package:flutter_events/domain/data/auth_data/session_api_provider.dart';
import 'package:flutter_events/domain/entity/user.dart';

class AuthException {}

class LoginException extends AuthException {}

class AuthService {
  final _sessionDataProvider = SessionDataProvider();
  final _authApiProvider = AuthAPIProvider();

  Future<bool> checkAuth() async {
    final apiKey = await _sessionDataProvider.apiKey();
    if (apiKey != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> login(String login, String password) async {
    final user = await _authApiProvider.getUser(login);
    if (user != null) {
      if (user.password == password) {
        await _sessionDataProvider.saveApiKey(login.hashCode.toString());
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  Future<bool> registrationUser(
      String login, String email, String password) async {
    if (await _authApiProvider.registrationUser(User(
        id: await _authApiProvider.getLastIndex() + 1,
        login: login,
        email: email,
        password: password))) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> logout() async {
    await _sessionDataProvider.clearApiKey();
  }
}

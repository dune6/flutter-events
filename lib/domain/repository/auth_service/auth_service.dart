import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_events/domain/data/auth_data/auth_api_provider.dart';
import 'package:flutter_events/domain/data/auth_data/session_api_provider.dart';
import 'package:flutter_events/domain/entity/user.dart';
import 'package:flutter_events/events/auth/auth_events.dart';
import 'package:meta/meta.dart';

part 'auth_service_state.dart';

class AuthException {}

class LoginException extends AuthException {}

class AuthService extends Bloc<AuthEvent, AuthServiceState> {
  final _sessionDataProvider = SessionDataProvider();
  final _authApiProvider = AuthAPIProvider();

  AuthService() : super(const AuthServiceState()) {
    on<RegistrationEvent>((event, emit) => registrationUser(event, emit));
    on<LoginEvent>((event, emit) => login(event, emit));
    on<CheckAuthEvent>((event, emit) => checkAuth(emit));
    on<LogoutEvent>((event, emit) => logout(emit));
  }

  Future<void> checkAuth(Emitter emit) async {
    final apiKey = await _sessionDataProvider.apiKey();
    if (apiKey != null) {
      emit(state.copyWith(isAuth: true));
    }
  }

  Future<void> login(LoginEvent event, Emitter emit) async {
    if (await _authApiProvider.getUser(event.login) != null) {
      await _sessionDataProvider.saveApiKey(event.login);
      emit(state.copyWith(isAuth: true));
    } else {
      throw LoginException();
    }
  }

  Future<void> registrationUser(RegistrationEvent event, Emitter emit) async {
    await _authApiProvider.registrationUser(
        User(login: event.login, email: event.email, password: event.password));
  }

  Future<void> logout(Emitter emit) async {
    await _sessionDataProvider.clearApiKey();
    emit(state.copyWith(isAuth: false));
  }
}

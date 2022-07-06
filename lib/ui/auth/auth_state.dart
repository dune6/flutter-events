import 'package:flutter/material.dart';

@immutable
class AuthState {
  static const registrationSelect = 1;
  static const successValidation = true;
  static const notAgreeSwitch = false;

  final int select; // выбранная кнопка вход/регистрация
  final String login;
  final String email;
  final String password;
  final String secondPassword;
  final bool validation; // состояние валидации после нажатия на кнопку
  final bool isAgreeSwitch;

  const AuthState({
    this.select = 1,
    this.login = '',
    this.email = '',
    this.password = '',
    this.secondPassword = '',
    this.validation = true,
    this.isAgreeSwitch = false,
  });

  AuthState copyWith({
    int? select,
    String? login,
    String? email,
    String? password,
    String? secondPassword,
    bool? validation,
    bool? isAgreeSwitch,
  }) {
    return AuthState(
      select: select ?? this.select,
      login: login ?? this.login,
      email: email ?? this.email,
      password: password ?? this.password,
      secondPassword: secondPassword ?? this.secondPassword,
      validation: validation ?? this.validation,
      isAgreeSwitch: isAgreeSwitch ?? this.isAgreeSwitch,
    );
  }
}

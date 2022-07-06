import 'package:flutter/material.dart';

@immutable
class AuthState {
  static const registrationSelect = 1;

  final int select; // выбранная кнопка вход/регистрация
  final String login;
  final String email;
  final String password;
  final String secondPassword;
  final bool validation; // состояние валидации после нажатия на кнопку
  final bool isAgreeSwitch;
  final bool successAuthed;

  const AuthState({
    this.select = registrationSelect,
    this.login = '',
    this.email = '',
    this.password = '',
    this.secondPassword = '',
    this.validation = true,
    this.isAgreeSwitch = false,
    this.successAuthed = false,
  });

  AuthState copyWith({
    int? select,
    String? login,
    String? email,
    String? password,
    String? secondPassword,
    bool? validation,
    bool? isAgreeSwitch,
    bool? successAuthed,
  }) {
    return AuthState(
        select: select ?? this.select,
        login: login ?? this.login,
        email: email ?? this.email,
        password: password ?? this.password,
        secondPassword: secondPassword ?? this.secondPassword,
        validation: validation ?? this.validation,
        isAgreeSwitch: isAgreeSwitch ?? this.isAgreeSwitch,
        successAuthed: successAuthed ?? this.successAuthed
    );
  }
}

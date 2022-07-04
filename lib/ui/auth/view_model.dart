import 'package:flutter/material.dart';
import 'package:flutter_events/resources/constants.dart';

import 'view_state.dart';

class ViewModel extends ChangeNotifier {
  static const validationError = false;
  static const validationSuccess = true;

  var _state = ViewModelState();

  ViewModelState get state => _state;

  // обновление соглашения с правилами, если true, то можно регать
  void switchAgree(bool value) {
    _state = _state.copyWith(isAgreeSwitch: value);
    notifyListeners();
  }

  // обработка состояния при нажати на вход/регистрацию
  void changeToggleButton(int index) {
    if (index == Constants.loginPageNumber) {
      _state = _state.copyWith(
          // обнуляем состояние при переходах с авторизации на регистрацию и наоборот
          select: Constants.loginPageNumber,
          login: '',
          password: '',
          validation: true,
          secondPassword: '',
          email: '',
          isAgreeSwitch: false);
    } else {
      _state = _state.copyWith(
          select: Constants.registrationPageNumber,
          login: '',
          password: '',
          validation: true,
          secondPassword: '',
          email: '',
          isAgreeSwitch: false);
    }
    notifyListeners();
  }

  // обработка ввода текста в форме login
  void changeLogin(String value) {
    if (_state.login == value) return;
    _state = _state.copyWith(login: value);
    notifyListeners();
  }

  // обработка ввода текста в форме email
  void changeEmail(String value) {
    if (_state.email == value) return;
    _state = _state.copyWith(email: value);
    notifyListeners();
  }

  // обработка ввода текста в форме password
  void changePassword(String value) {
    if (_state.password == value) return;
    _state = _state.copyWith(password: value);
    notifyListeners();
  }

  // обработка ввода текста в форме second password
  void changeSecondPassword(String value) {
    if (_state.secondPassword == value) return;
    _state = _state.copyWith(secondPassword: value);
    notifyListeners();
  }

  // обработка нажатия на кнопку "Вход"
  void onLoginButtonPressed({required String login, required String password}) {
    if (validateLogin(login) && validatePassword(password)) {
      _state = _state.copyWith(validation: validationSuccess);
      // TODO navigate to main screen
    } else {
      _state = _state.copyWith(validation: validationError);
    }
    notifyListeners();
  }

  // обработка нажатия на кнопку "Регистрация"
  void onRegistrationButtonPressed({
    required String login,
    required String email,
    required String password,
    required String secondPassword,
  }) {
    if (validateLogin(login) &&
        validateEmail(email) &&
        validatePassword(password) &&
        validatePassword(secondPassword)) {
      _state = _state.copyWith(validation: validationSuccess);
      // TODO navigate to login
      // TODO запись в локальное хранилище
    } else {
      _state = _state.copyWith(validation: validationError);
    }
    notifyListeners();
  }

// validation helpers
  static bool validateLogin(String value) {
    return (value.isNotEmpty && value.length > 4 && value.length < 12);
  }

  static bool validateEmail(String value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value.isEmpty || !regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  static bool validatePassword(String value) {
    return (value.isNotEmpty && value.length > 5 && value.length < 12);
  }
}

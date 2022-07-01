import 'package:flutter/material.dart';
import 'package:flutter_events/resources/constants.dart';

import 'view_state.dart';

class ViewModel extends ChangeNotifier {
  static const validationError = false;
  static const validationSuccess = true;

  var _state = ViewModelState();
  ViewModelState get state => _state;

  void switchAgree(bool value) {
    _state = _state.copyWith(isAgreeSwitch: value);
  }

  // обработка состояния при нажати на вход/регистрацию
  void changeToggleButton(int index) {
    if (index == Constants.loginPageNumber) {
      _state = _state.copyWith(select: Constants.loginPageNumber);
    } else {
      _state = _state.copyWith(select: Constants.registrationPageNumber);
    }
    notifyListeners();
  }

  void changeLogin(String value) {
    if (_state.login == value) return;
    _state = _state.copyWith(login: value);
    notifyListeners();
  }

  void changeEmail(String value) {
    if (_state.email == value) return;
    _state = _state.copyWith(email: value);
    notifyListeners();
  }

  void changePassword(String value) {
    if (_state.password == value) return;
    _state = _state.copyWith(password: value);
    notifyListeners();
  }

  void changeSecondPassword(String value) {
    if (_state.secondPassword == value) return;
    _state = _state.copyWith(secondPassword: value);
    notifyListeners();
  }

  void onLoginButtonPressed({required String login, required String password}) {
    if (validateLogin(login) && validatePassword(password)) {
      _state = _state.copyWith(validation: validationSuccess);
      // TODO navigate to main screen
    } else {
      _state = _state.copyWith(validation: validationError);
    }
  }

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
      // TODO navigate to main screen
    } else {
      _state = _state.copyWith(validation: validationError);
    }
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

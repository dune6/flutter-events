import 'package:flutter/material.dart';
import 'package:flutter_events/resources/constants.dart';

import 'view_state.dart';

class ViewModel extends ChangeNotifier {
  var _state = ViewModelState();

  ViewModelState get state => _state;

  void switchAgree() {} // TODO add logic

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
}

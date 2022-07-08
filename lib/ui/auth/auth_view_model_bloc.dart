import 'package:bloc/bloc.dart';
import 'package:flutter_events/domain/repository/auth_service/auth_service.dart';
import 'package:flutter_events/events/auth/auth_events.dart';
import 'package:flutter_events/resources/constants.dart';

import 'auth_state.dart';

class AuthViewModelBloc extends Bloc<AuthEvent, AuthState> {
  final _authService = AuthService();

  AuthViewModelBloc(AuthState initialState) : super(initialState) {
    on<ChangeToggleButtonEvent>(
        (event, emit) => changeToggleButton(event, emit));
    on<ChangeLoginEvent>((event, emit) => changeLogin(event, emit));
    on<ChangeEmailEvent>((event, emit) => changeEmail(event, emit));
    on<ChangePasswordEvent>((event, emit) => changePassword(event, emit));
    on<ChangeSecondPasswordEvent>(
        (event, emit) => changeSecondPassword(event, emit));
    on<SwitchAgreeEvent>((event, emit) => switchAgree(event, emit));
    on<LoginEvent>((event, emit) => onLoginButtonPressed(event, emit));
    on<RegistrationEvent>(
        (event, emit) => onRegistrationButtonPressed(event, emit));
    on<ChangeAuthedAuth>((event, emit) => changeAuthed(emit));
  }

  void changeAuthed(Emitter emit) => emit(state.copyWith(successAuthed: false));

  // обработка состояния при нажати на вход/регистрацию
  void changeToggleButton(ChangeToggleButtonEvent event, Emitter emit) {
    if (event.index == Constants.loginPageNumber) {
      emit(clearStateWithSelect(Constants.loginPageNumber, state));
    } else {
      emit(clearStateWithSelect(Constants.registrationPageNumber, state));
    }
  }

  // обработка ввода текста в форме login
  void changeLogin(ChangeLoginEvent event, Emitter emit) {
    if (state.login == event.value) return;
    emit(state.copyWith(login: event.value));
  }

  // обработка ввода текста в форме email
  void changeEmail(ChangeEmailEvent event, Emitter emit) {
    if (state.email == event.value) return;
    emit(state.copyWith(email: event.value));
  }

  // обработка ввода текста в форме password
  void changePassword(ChangePasswordEvent event, Emitter emit) {
    if (state.password == event.value) return;
    emit(state.copyWith(password: event.value));
  }

  // обработка ввода текста в форме second password
  void changeSecondPassword(ChangeSecondPasswordEvent event, Emitter emit) {
    if (state.secondPassword == event.value) return;
    emit(state.copyWith(secondPassword: event.value));
  }

  // обновление соглашения с правилами, если true, то можно регать
  void switchAgree(SwitchAgreeEvent event, Emitter emit) {
    emit(state.copyWith(isAgreeSwitch: event.index));
  }

  // обработка нажатия на кнопку "Вход"
  Future<void> onLoginButtonPressed(LoginEvent event, Emitter emit) async {
    if (validateLogin(event.login) && validatePassword(event.password)) {
      emit(state.copyWith(validation: true));
      if (await _authService.login(event.login, event.password)) {
        emit(state.copyWith(successAuthed: true));
      }
    } else {
      emit(state.copyWith(validation: false));
    }
  }

  // обработка нажатия на кнопку "Регистрация"
  Future<void> onRegistrationButtonPressed(
      RegistrationEvent event, Emitter emit) async {
    if (validateLogin(event.login) &&
        validateEmail(event.email) &&
        validatePassword(event.password) &&
        validatePassword(event.secondPassword) &&
        event.password == event.secondPassword &&
        state.isAgreeSwitch) {
      emit(state.copyWith(validation: true));
      if (await _authService.registrationUser(
          event.login, event.email, event.password)) {
        // если регистрация прошла успешно
        emit(clearStateWithSelect(Constants.loginPageNumber, state));
      } else {
        emit(state.copyWith(validation: false));
      }
    } else {
      emit(state.copyWith(validation: false));
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

  // helper
  AuthState clearStateWithSelect(int select, AuthState state) {
    return state.copyWith(
      select: select,
      login: '',
      password: '',
      validation: true,
      secondPassword: '',
      email: '',
      isAgreeSwitch: false,
    );
  }
}

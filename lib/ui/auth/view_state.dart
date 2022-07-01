class ViewModelState {
  static const registrationSelect = 1;

  final int select; // выбранная кнопка вход/регистрация
  final String login;
  final String email;
  final String password;
  final String secondPassword;
  final bool validation; // состояние валидации после нажатия на кнопку
  final bool isAgreeSwitch;

  ViewModelState({
    this.select = registrationSelect,
    this.login = '',
    this.email = '',
    this.password = '',
    this.secondPassword = '',
    this.isAgreeSwitch = false,
  });

  ViewModelState copyWith({
    int? select,
    String? login,
    String? email,
    String? password,
    String? secondPassword,
    bool? validation,
    bool? isAgreeSwitch,
  }) {
    return ViewModelState(
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

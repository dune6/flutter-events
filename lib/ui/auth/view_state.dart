class ViewModelState {
  static const registrationSelect = 1;
  static const successValidation = true;
  static const notAgreeSwitch = false;

  final int select;
  final String login;
  final String email;
  final String password;
  final String secondPassword;
  final bool validation;
  final bool isAgreeSwitch;

  ViewModelState({
    this.select = registrationSelect,
    this.login = '',
    this.email = '',
    this.password = '',
    this.secondPassword = '',
    this.validation = successValidation,
    this.isAgreeSwitch = notAgreeSwitch,
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

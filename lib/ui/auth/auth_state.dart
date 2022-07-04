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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuthState &&
          runtimeType == other.runtimeType &&
          select == other.select &&
          login == other.login &&
          email == other.email &&
          password == other.password &&
          secondPassword == other.secondPassword &&
          validation == other.validation &&
          isAgreeSwitch == other.isAgreeSwitch);

  @override
  int get hashCode =>
      select.hashCode ^
      login.hashCode ^
      email.hashCode ^
      password.hashCode ^
      secondPassword.hashCode ^
      validation.hashCode ^
      isAgreeSwitch.hashCode;

  @override
  String toString() {
    return 'AuthState{' +
        ' select: $select,' +
        ' login: $login,' +
        ' email: $email,' +
        ' password: $password,' +
        ' secondPassword: $secondPassword,' +
        ' validation: $validation,' +
        ' isAgreeSwitch: $isAgreeSwitch,' +
        '}';
  }

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

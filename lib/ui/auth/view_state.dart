class ViewModelState {
  final int select;
  final String login;
  final String email;
  final String password;
  final String secondPassword;
  final bool isAgreeSwitch;

  ViewModelState({
    this.select = 1,
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
    bool? isAgreeSwitch,
  }) {
    return ViewModelState(
      select: select ?? this.select,
      login: login ?? this.login,
      email: email ?? this.email,
      password: password ?? this.password,
      secondPassword: secondPassword ?? this.secondPassword,
      isAgreeSwitch: isAgreeSwitch ?? this.isAgreeSwitch,
    );
  }
}

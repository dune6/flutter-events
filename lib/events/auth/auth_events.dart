abstract class AuthEvent {}

// business logic events
class LoginEvent extends AuthEvent {
  final String login;
  final String password;

  LoginEvent(this.login, this.password);
}

class RegistrationEvent extends AuthEvent {
  final String login;
  final String email;
  final String password;
  final String secondPassword;

  RegistrationEvent(this.login, this.email, this.password, this.secondPassword);
}

// AUTH VIEW MODEL EVENTS:::::

// TOGGLE BUTTON
class ChangeToggleButtonEvent extends AuthEvent {
  final int index;

  ChangeToggleButtonEvent(this.index);
}

// LOGIN
class ChangeLoginEvent extends AuthEvent {
  final String value;

  ChangeLoginEvent(this.value);
}

// EMAIL
class ChangeEmailEvent extends AuthEvent {
  final String value;

  ChangeEmailEvent(this.value);
}

// PASS
class ChangePasswordEvent extends AuthEvent {
  final String value;

  ChangePasswordEvent(this.value);
}

// SECOND PASS
class ChangeSecondPasswordEvent extends AuthEvent {
  final String value;

  ChangeSecondPasswordEvent(this.value);
}

// SWITCH
class SwitchAgreeEvent extends AuthEvent {
  final bool index;

  SwitchAgreeEvent(this.index);
}
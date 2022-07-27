import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_events/di/global_factory.dart';
import 'package:flutter_events/ui/auth/auth_events.dart';
import 'package:flutter_events/resources/constants.dart';
import 'package:flutter_events/resources/strings.dart';
import 'package:flutter_events/ui/auth/support_widgets/login_page_widget.dart';
import 'package:flutter_events/ui/auth/support_widgets/registration_page_widget.dart';
import 'package:flutter_events/ui/auth/support_widgets/text_button_widget.dart';
import 'package:flutter_events/ui/auth/support_widgets/toggle_buttons_widget.dart';
import 'package:flutter_events/ui/global_widgets/error_text_widget.dart';

import 'auth_state.dart';
import 'auth_view_model.dart';

class AuthWidget extends StatelessWidget {
  // constants
  static const heightPadding = 20.0;

  const AuthWidget({Key? key}) : super(key: key);

  static Widget create() {
    return BlocProvider(
      create: (_) => AuthViewModel(const AuthState(),
          authRepository: GlobalFactory().authService()),
      child: const AuthWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authViewModelBloc = context.watch<AuthViewModel>(); // get view model

    // авторизация или регистрация, зависит от toggle button
    Widget contentPage;
    if (authViewModelBloc.state.select == Constants.loginPageNumber) {
      contentPage = const LoginPageWidget();
    } else {
      contentPage = const RegistrationPageWidget();
    }

    // пишем об ошибке, если валидация полей не прошла
    Widget validationError = authViewModelBloc.state.validation
        ? const SizedBox() // по сути пустой пиксель
        : ErrorTextWidget(
            errorText: authViewModelBloc.state.validationTextError);

    // адаптивная кнопка авторизации
    Widget textButton =
        authViewModelBloc.state.select == Constants.loginPageNumber
            ? TextButtonWidget<LoginEvent>(
                event: LoginEvent(authViewModelBloc.state.login,
                    authViewModelBloc.state.password),
                text: Strings.entry)
            : TextButtonWidget<RegistrationEvent>(
                event: RegistrationEvent(
                    authViewModelBloc.state.login,
                    authViewModelBloc.state.email,
                    authViewModelBloc.state.password,
                    authViewModelBloc.state.secondPassword),
                text: Strings.registration);

    // ui
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: heightPadding),
            child: ToggleButtonsWidget(),
          ),
          validationError,
          contentPage, // content by viewModel
          textButton,
        ],
      )),
    );
  }
}

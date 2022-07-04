import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_events/events/auth/auth_events.dart';
import 'package:flutter_events/resources/constants.dart';
import 'package:flutter_events/resources/strings.dart';
import 'package:flutter_events/ui/auth/support_widgets/login_page_widget.dart';
import 'package:flutter_events/ui/auth/support_widgets/registration_page_widget.dart';
import 'package:flutter_events/ui/auth/support_widgets/text_button_widget.dart';
import 'package:flutter_events/ui/auth/support_widgets/toggle_buttons_widget.dart';
import 'package:flutter_events/ui/global_widgets/error_text_widget.dart';

import 'auth_view_model_bloc.dart';

class AuthWidget extends StatelessWidget {
  // constants
  static const heightPadding = 20.0;

  const AuthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AuthViewModelBloc>(); // get view model

    // это кажется более изящным, чем 2 больших метода в этом классе
    Widget contentPage;
    if (bloc.state.select == Constants.loginPageNumber) {
      contentPage = const LoginPageWidget();
    } else {
      contentPage = const RegistrationPageWidget();
    }

    // пишем об ошибке, если валидация полей не прошла
    Widget validationError = bloc.state.validation
        ? const SizedBox.shrink() // по сути пустой пиксель
        : const ErrorTextWidget();

    // адаптивная кнопка авторизации
    Widget textButton = bloc.state.select == Constants.loginPageNumber
        ? TextButtonWidget<LoginEvent>(
            event: LoginEvent(bloc.state.login, bloc.state.password),
            text: Strings.entry)
        : TextButtonWidget<RegistrationEvent>(
            event: RegistrationEvent(bloc.state.login, bloc.state.email,
                bloc.state.password, bloc.state.secondPassword),
            text: Strings.registration);

    // ui
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Center(
          child: Column(
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

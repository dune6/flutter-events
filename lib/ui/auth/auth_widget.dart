import 'package:flutter/material.dart';
import 'package:flutter_events/resources/constants.dart';
import 'package:flutter_events/resources/strings.dart';
import 'package:flutter_events/ui/auth/support_widgets/login_page_widget.dart';
import 'package:flutter_events/ui/auth/support_widgets/registration_page_widget.dart';
import 'package:flutter_events/ui/auth/support_widgets/text_button_widget.dart';
import 'package:flutter_events/ui/auth/support_widgets/toggle_buttons_widget.dart';
import 'package:flutter_events/ui/global_widgets/error_text_widget.dart';
import 'package:provider/provider.dart';

import 'view_model.dart';

class AuthWidget extends StatelessWidget {
  // constants
  static const heightPadding = 20.0;

  const AuthWidget({Key? key}) : super(key: key);

  static Widget create() {
    return ChangeNotifierProvider(
      create: (_) => ViewModel(),
      child: const AuthWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ViewModel>(); // get view model

    // это кажется более изящным, чем 2 больших метода в этом классе
    Widget contentPage;
    if (model.state.select == Constants.loginPageNumber) {
      contentPage = const LoginPageWidget();
    } else {
      contentPage = const RegistrationPageWidget();
    }

    // пишем об ошибке, если валидация полей не прошла
    Widget validationError = model.state.validation
        ? const SizedBox.shrink() // по сути пустой пиксель
        : const ErrorTextWidget();

    // адаптивная кнопка авторизации
    Widget textButton = model.state.select == Constants.loginPageNumber
        ? TextButtonWidget(
            fun: () => model.onLoginButtonPressed(
                login: model.state.login, password: model.state.password),
            text: Strings.entry)
        : TextButtonWidget(
            fun: () => model.onRegistrationButtonPressed(
                login: model.state.login,
                email: model.state.email,
                password: model.state.password,
                secondPassword: model.state.secondPassword),
            text: Strings.registration,
          );

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

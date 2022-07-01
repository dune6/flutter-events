import 'package:flutter/material.dart';
import 'package:flutter_events/resources/constants.dart';
import 'package:flutter_events/ui/auth/support_widgets/login_button_widget.dart';
import 'package:flutter_events/ui/auth/support_widgets/registration_button_widget.dart';
import 'package:flutter_events/ui/auth/support_widgets/switcher_rules_widget.dart';
import 'package:flutter_events/ui/auth/support_widgets/toggle_buttons_widget.dart';
import 'package:flutter_events/ui/global_widgets/error_text_widget.dart';
import 'package:provider/provider.dart';

import '../../resources/strings.dart';
import '../global_widgets/input_text_widget.dart';
import 'view_model.dart';

class AuthWidget extends StatelessWidget {
  // constants
  static const heightPadding = 20.0;
  static const obscure = true;
  static const notObscure = false;

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

    Widget contentPage = model.state.select == Constants.loginPageNumber
        ? setLoginWidget(
            // login
            funcLogin: (text) => model.changeLogin(text),
            funcPassword: (text) => model.changePassword(text),
          )
        : setRegistrationWidget(
            // registration
            funcLogin: (text) => model.changeLogin(text),
            funcChangeEmail: (text) => model.changeEmail(text),
            funcPassword: (text) => model.changePassword(text),
            funcSecondPassword: (text) => model.changeSecondPassword(text));

    Widget validationError = model.state.validation
        ? const SizedBox.shrink()
        : const ErrorTextWidget();

    Widget textButton = model.state.select == Constants.loginPageNumber
        ? const LoginTextButtonWidget()
        : const RegistrationTextButtonWidget();

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

   // todo Возможно ошибка в том, что мы обновляем один виджет, а не подставляем другой
  Widget setLoginWidget(
      {required Function funcLogin, required Function funcPassword}) {
    return Column(
      children: [
        InputText(
          name: Strings.login,
          func: (text) => funcLogin(text),
          obscureText: notObscure,
        ),
        InputText(
            name: Strings.password,
            func: (text) => funcPassword(text),
            obscureText: obscure),
      ],
    );
  }

  Widget setRegistrationWidget(
      {required Function funcLogin,
      required Function funcChangeEmail,
      required Function funcPassword,
      required Function funcSecondPassword}) {
    return Column(
      children: [
        InputText(
            name: Strings.login,
            func: (text) => funcLogin(text),
            obscureText: notObscure),
        InputText(
            name: Strings.email,
            func: (text) => funcChangeEmail(text),
            obscureText: notObscure),
        InputText(
            name: Strings.password,
            func: (text) => funcPassword(text),
            obscureText: obscure),
        InputText(
            name: Strings.repeatPassword,
            func: (text) => funcSecondPassword(text),
            obscureText: obscure),
        const Padding(
          padding: EdgeInsets.only(top: heightPadding),
          child: AgreeWithRules(),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_events/resources/constants.dart';
import 'package:flutter_events/ui/auth/support_widgets/button_widget.dart';
import 'package:flutter_events/ui/auth/support_widgets/switcher_rules_widget.dart';
import 'package:flutter_events/ui/auth/support_widgets/toggle_buttons_widget.dart';
import 'package:provider/provider.dart';

import '../../resources/strings.dart';
import '../global_widgets/input_text_widget.dart';
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
    Widget contentPage = model.state.select == Constants.loginPageNumber
        ? setLoginWidget(
            funcLogin: model.changeLogin, funcPassword: model.changePassword)
        : setRegistrationWidget(
            funcLogin: model.changeLogin,
            funcChangeEmail: model.changeEmail,
            funcPassword: model.changePassword,
            funcSecondPassword: model.changeSecondPassword);

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
          contentPage, // content by viewModel
        ],
      )),
    );
  }

  Widget setLoginWidget(
      {required Function funcLogin, required Function funcPassword}) {
    return Column(
      children: [
        InputText(name: Strings.login, func: funcLogin),
        InputText(name: Strings.password, func: funcPassword),
        const Padding(
          padding: EdgeInsets.only(top: heightPadding),
          child: TextButtonWidget(text: Strings.entry),
        ),
      ],
    );
  }

  Widget setRegistrationWidget({
    required Function funcLogin,
    required Function funcChangeEmail,
    required Function funcPassword,
    required Function funcSecondPassword,
  }) {
    return Column(
      children: [
        InputText(name: Strings.login, func: funcLogin),
        InputText(name: Strings.email, func: funcChangeEmail),
        InputText(name: Strings.password, func: funcPassword),
        InputText(name: Strings.repeatPassword, func: funcSecondPassword),
        const Padding(
          padding: EdgeInsets.only(top: heightPadding),
          child: AgreeWithRules(),
        ),
        const TextButtonWidget(text: Strings.registration),
      ],
    );
  }
}

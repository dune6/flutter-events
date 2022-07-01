import 'package:flutter/material.dart';
import 'package:flutter_events/resources/constants.dart';
import 'package:flutter_events/resources/strings.dart';
import 'package:flutter_events/ui/auth/auth_widget.dart';
import 'package:flutter_events/ui/auth/support_widgets/switcher_rules_widget.dart';
import 'package:flutter_events/ui/global_widgets/input_text_widget.dart';
import 'package:provider/provider.dart';

import '../view_model.dart';

class RegistrationPageWidget extends StatelessWidget {
  const RegistrationPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<ViewModel>();
    return Column(
      children: [
        InputText(
            name: Strings.login,
            func: (text) => model.changeLogin(text),
            obscureText: Constants.notObscure),
        InputText(
            name: Strings.email,
            func: (text) => model.changeEmail(text),
            obscureText: Constants.notObscure),
        InputText(
            name: Strings.password,
            func: (text) => model.changePassword(text),
            obscureText: Constants.obscure),
        InputText(
            name: Strings.repeatPassword,
            func: (text) => model.changeSecondPassword(text),
            obscureText: Constants.obscure),
        const Padding(
          padding: EdgeInsets.only(top: AuthWidget.heightPadding),
          child: AgreeWithRules(),
        ),
      ],
    );
  }
}

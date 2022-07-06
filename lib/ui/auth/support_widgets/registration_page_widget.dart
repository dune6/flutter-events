import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_events/ui/auth/auth_events.dart';
import 'package:flutter_events/resources/constants.dart';
import 'package:flutter_events/resources/strings.dart';
import 'package:flutter_events/ui/auth/auth_widget.dart';
import 'package:flutter_events/ui/auth/support_widgets/switcher_rules_widget.dart';
import 'package:flutter_events/ui/global_widgets/input_text_widget.dart';

import '../auth_view_model_bloc.dart';

class RegistrationPageWidget extends StatelessWidget {
  const RegistrationPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthViewModelBloc>();

    return Column(
      children: [
        InputText(
            name: Strings.login,
            func: (text) => bloc.add(ChangeLoginEvent(text)),
            obscureText: Constants.notObscure),
        InputText(
            name: Strings.email,
            func: (text) => bloc.add(ChangeEmailEvent(text)),
            obscureText: Constants.notObscure),
        InputText(
            name: Strings.password,
            func: (text) => bloc.add(ChangePasswordEvent(text)),
            obscureText: Constants.obscure),
        InputText(
            name: Strings.repeatPassword,
            func: (text) => bloc.add(ChangeSecondPasswordEvent(text)),
            obscureText: Constants.obscure),
        const Padding(
          padding: EdgeInsets.only(top: AuthWidget.heightPadding),
          child: AgreeWithRules(),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_events/resources/constants.dart';
import 'package:flutter_events/resources/strings.dart';
import 'package:flutter_events/ui/auth/view_model.dart';
import 'package:flutter_events/ui/global_widgets/input_text_widget.dart';
import 'package:provider/provider.dart';

class LoginPageWidget extends StatelessWidget {
  const LoginPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<ViewModel>();
    return Column(
      children: [
        InputText(
          name: Strings.login,
          func: (text) => model.changeLogin(text),
          obscureText: Constants.notObscure,
        ),
        InputText(
            name: Strings.password,
            func: (text) => model.changePassword(text),
            obscureText: Constants.obscure),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_events/ui/auth/view_model.dart';
import 'package:provider/provider.dart';

import '../../../resources/strings.dart';

class LoginTextButtonWidget extends StatelessWidget {
  const LoginTextButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<ViewModel>();
    return TextButton(
        onPressed: () => model.onLoginButtonPressed(
            login: model.state.login, password: model.state.password),
        child: const Text(Strings.entry));
  }
}

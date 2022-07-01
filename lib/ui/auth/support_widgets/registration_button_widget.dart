import 'package:flutter/material.dart';
import 'package:flutter_events/ui/auth/view_model.dart';
import 'package:provider/provider.dart';

import '../../../resources/strings.dart';

class RegistrationTextButtonWidget extends StatelessWidget {
  const RegistrationTextButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<ViewModel>();
    return TextButton(
        onPressed: () => model.onRegistrationButtonPressed(
            login: model.state.login,
            email: model.state.email,
            password: model.state.password,
            secondPassword: model.state.secondPassword),
        child: const Text(Strings.registration));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_events/ui/auth/auth_events.dart';
import 'package:flutter_events/resources/constants.dart';
import 'package:flutter_events/resources/strings.dart';
import 'package:flutter_events/ui/auth/auth_view_model.dart';
import 'package:flutter_events/ui/global_widgets/input_text_widget.dart';
import 'package:flutter_events/ui/navigation/nav_routes.dart';

class LoginPageWidget extends StatelessWidget {
  const LoginPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AuthViewModel>();

    if (bloc.state.successAuthed) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(NavRoutes.homeRoute, (route) => false);
      });
    }

    return Column(
      children: [
        InputText(
          name: Strings.login,
          func: (text) => bloc.add(ChangeLoginEvent(text)),
          obscureText: Constants.notObscure,
        ),
        InputText(
            name: Strings.password,
            func: (text) => bloc.add(ChangePasswordEvent(text)),
            obscureText: Constants.obscure),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_events/resources/strings.dart';
import 'package:flutter_events/ui/auth/auth_events.dart';
import 'package:flutter_events/ui/auth/auth_view_model.dart';
import 'package:flutter_events/ui/home/account/account_view_model.dart';
import 'package:flutter_events/ui/home/account/support_widgets/account_information_widget.dart';
import 'package:flutter_events/ui/navigation/nav_routes.dart';
import 'package:flutter_events/ui/splash_screen/splash_view_model.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({Key? key}) : super(key: key);

  static const _logoSize = 100.0;
  static const _logoPadding = 50.0;

  @override
  Widget build(BuildContext context) {
    final accountViewModelBloc = context.watch<AccountViewModel>();
    final authViewModelBloc = context.read<AuthViewModel>();
    final splashViewModelBloc = context.read<SplashViewModel>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
                padding: EdgeInsets.all(_logoPadding),
                child: FlutterLogo(
                  size: _logoSize,
                )),
            AccountInformationWidget(
                login: accountViewModelBloc.state.userModel.login,
                email: accountViewModelBloc.state.userModel.email,
                years: accountViewModelBloc.state.userModel.years,
                gender: accountViewModelBloc.state.userModel.gender),
            BlocListener<AccountViewModel, AccountState>(
              listener: (context, state) {
                if (state.isAuth == false) {
                  authViewModelBloc.add(ChangeAuthedAuth());
                  splashViewModelBloc.add(ChangeAuthSplash());
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        NavRoutes.authRoute, (route) => false);
                  });
                }
              },
              child: ElevatedButton(
                  onPressed: () =>
                      accountViewModelBloc.add(AccountLogoutEvent()),
                  child: const Text(Strings.logout)),
            ),
          ],
        ),
      ),
    );
  }
}

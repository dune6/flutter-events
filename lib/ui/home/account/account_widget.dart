import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_events/domain/entity/user/user_model.dart';
import 'package:flutter_events/ui/auth/auth_state.dart';
import 'package:flutter_events/ui/home/account/account_bloc.dart';
import 'package:flutter_events/ui/home/account/support_widgets/account_information_widget.dart';

import '../../../resources/strings.dart';
import '../../auth/auth_events.dart';
import '../../auth/auth_view_model_bloc.dart';
import '../../navigation/nav_routes.dart';
import '../../splash_screen/splash_bloc.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({Key? key}) : super(key: key);

  static const _logoSize = 100.0;
  static const _logoPadding = 50.0;

  static Widget create() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) =>
                SplashViewModelBloc(const SplashState(isAuth: true))),
        BlocProvider(create: (_) => AuthViewModelBloc(const AuthState())),
        BlocProvider(
            create: (_) => AccountViewModelBloc(
                AccountState(isAuth: true, userModel: UserModel.emptyUser()))
              ..add(AccountGetUserEvent())), // init user from db
      ],
      child: const AccountWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final blocAccount = context.watch<AccountViewModelBloc>();
    final blocAuth = context.read<AuthViewModelBloc>();
    final blocSplash = context.read<SplashViewModelBloc>();

    return Scaffold(
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                  padding: EdgeInsets.all(_logoPadding),
                  child: FlutterLogo(
                    size: _logoSize,
                  )),
              AccountInformationWidget(
                  login: blocAccount.state.userModel.login,
                  email: blocAccount.state.userModel.email,
                  years: blocAccount.state.userModel.years,
                  gender: blocAccount.state.userModel.gender,
                  telegram: blocAccount.state.userModel.telegram),
              BlocListener<AccountViewModelBloc, AccountState>(
                listener: (context, state) {
                  if (state.isAuth == false) {
                    blocAuth.add(ChangeAuthedAuth());
                    blocSplash.add(ChangeAuthSplash());
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          NavRoutes.authRoute, (route) => false);
                    });
                  }
                },
                child: ElevatedButton(
                    onPressed: () => blocAccount.add(AccountLogoutEvent()),
                    child: const Text(Strings.logout)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

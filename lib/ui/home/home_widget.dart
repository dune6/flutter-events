import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_events/resources/strings.dart';
import 'package:flutter_events/ui/auth/auth_state.dart';
import 'package:flutter_events/ui/auth/auth_view_model_bloc.dart';
import 'package:flutter_events/ui/auth/auth_widget.dart';
import 'package:flutter_events/ui/home/home_bloc.dart';
import 'package:flutter_events/ui/splash_screen/splash_bloc.dart';

import '../../events/auth/auth_events.dart';
import '../navigation/nav_routes.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  static Widget create() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthViewModelBloc(const AuthState()),
          child: const AuthWidget(),
        ),
        BlocProvider(
          create: (_) => SplashViewModelBloc(const SplashState(isAuth: true)),
          child: const HomeWidget(),
        ),
        BlocProvider(
          create: (_) => HomeBloc(const HomeState(isAuth: true)),
          child: const HomeWidget(),
        ),
      ],
      child: const HomeWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();
    final blocAuth = context.read<AuthViewModelBloc>();
    final blocSplash = context.read<SplashViewModelBloc>();

    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () => bloc.add(LogoutEventHome()),
              child: const Text(Strings.logout)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocListener<HomeBloc, HomeState>(
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
              child: const Text('Home'),
            ),
            ElevatedButton(
                onPressed: () => bloc.add(CheckLastIdUser()),
                child: const Text('check last id')),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_events/di/global_factory.dart';
import 'package:flutter_events/ui/navigation/nav_routes.dart';
import 'package:flutter_events/ui/splash_screen/splash_view_model.dart';
import 'package:flutter_svg/svg.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({Key? key}) : super(key: key);

  static Widget create() {
    return BlocProvider(
      create: (_) => SplashViewModel(const SplashState(isAuth: false),
          authService: GlobalFactory().authService()),
      child: const SplashWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<SplashViewModel, SplashState>(
        listener: (context, state) {
          if (state.isAuth) {
            Timer(const Duration(seconds: 3), () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  NavRoutes.homeRoute, (route) => false);
            });
          } else {
            Timer(const Duration(seconds: 3), () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  NavRoutes.authRoute, (route) => false);
            });
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LimitedBox(
                child: SvgPicture.asset(
                  'assets/event.svg',
                  width: 100,
                  height: 100,
                ),
                maxHeight: 100,
                maxWidth: 100,
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

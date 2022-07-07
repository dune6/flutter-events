import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_events/resources/strings.dart';
import 'package:flutter_events/ui/home/home_bloc.dart';

import '../navigation/nav_routes.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  static Widget create() {
    return BlocProvider(
      create: (_) => HomeBloc(const HomeState(isAuth: true)),
      child: const HomeWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();

    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () => bloc.add(LogoutEvent()),
              child: const Text(Strings.logout)),
        ],
      ),
      body: Center(
        child: BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state.isAuth == false) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  NavRoutes.authRoute, (route) => false);
            }
          },
          child: const Text('Home'),
        ),
      ),
    );
  }
}

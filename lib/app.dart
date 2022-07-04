import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_events/ui/auth/auth_state.dart';
import 'package:flutter_events/ui/auth/auth_view_model_bloc.dart';
import 'package:flutter_events/ui/auth/auth_widget.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => AuthViewModelBloc(const AuthState()),
        child: const AuthWidget(),
      ),
    );
  }
}

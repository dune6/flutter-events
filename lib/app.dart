import 'package:flutter/material.dart';
import 'package:flutter_events/ui/auth/auth_widget.dart';
import 'package:flutter_events/ui/navigation/nav_routes.dart';
import 'package:flutter_events/ui/splash_screen/splash_screen_widget.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of  your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashWidget.create(),
      routes: {
        NavRoutes.authRoute: (_) => AuthWidget.create(),
        NavRoutes.splashRoute: (_) => SplashWidget.create(),
      },
    );
  }
}

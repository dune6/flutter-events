import 'package:flutter/material.dart';
import 'package:flutter_events/resources/strings.dart';

class ErrorTextWidget extends StatelessWidget {
  const ErrorTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      Strings.errorText,
      style: TextStyle(
        color: Colors.red,
      ),
    );
  }
}

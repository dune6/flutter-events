import 'package:flutter/material.dart';

class ErrorTextWidget extends StatelessWidget {
  final String? errorText;

  const ErrorTextWidget({Key? key, required this.errorText}) : super(key: key);

  static const horizontalPadding = 20.0;
  static const verticalPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: verticalPadding, horizontal: horizontalPadding),
      child: Text(
        errorText ?? '',
        style: const TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }
}

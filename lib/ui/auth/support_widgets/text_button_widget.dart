import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final Function fun;
  final String text;

  const TextButtonWidget({Key? key, required this.fun, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () => fun(), child: Text(text));
  }
}

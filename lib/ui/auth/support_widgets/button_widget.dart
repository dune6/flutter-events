import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;

  const TextButtonWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () => {}, child: Text(text));
  }
}

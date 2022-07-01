import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  static const verticalPaddingInput = 3.0;
  static const horizontalPaddingInput = 20.0;
  static const heightTextInput = 40.0;

  final String name;
  final Function func;
  final bool obscureText;

  const InputText(
      {Key? key,
      required this.name,
      required this.func,
      required this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: verticalPaddingInput, horizontal: horizontalPaddingInput),
      child: SizedBox(
        height: heightTextInput,
        child: TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: name,
          ),
          onChanged: (text) => func(text),
        ),
      ),
    );
  }
}

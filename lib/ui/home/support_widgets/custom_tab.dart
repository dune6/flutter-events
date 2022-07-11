import 'package:flutter/material.dart';

class CustomTopBarTab extends StatelessWidget {
  final String text;
  final Icon icon;

  const CustomTopBarTab({Key? key, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      text: text,
      icon: icon,
    );
  }
}

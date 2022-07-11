import 'package:flutter/material.dart';
import 'package:flutter_events/resources/strings.dart';

class AccountInformationWidget extends StatelessWidget {
  final String login;
  final String email;
  final int years;
  final String gender;
  final String telegram;

  const AccountInformationWidget(
      {Key? key,
      required this.login,
      required this.email,
      required this.years,
      required this.gender,
      required this.telegram})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customText(Strings.login, login),
        customText(Strings.email, email),
        customText(Strings.years, years),
        customText(Strings.gender, gender),
        customText(Strings.telegram, telegram),
      ],
    );
  }

  Widget customText<T>(String info, T text) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          '$info: ${text.toString()}',
          style: const TextStyle(
            fontSize: 16,
          ),
        ));
  }
}

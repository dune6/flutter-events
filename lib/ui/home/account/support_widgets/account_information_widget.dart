import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_events/resources/strings.dart';
import 'package:flutter_events/ui/home/account/account_view_model.dart';
import 'package:flutter_picker/Picker.dart';

class AccountInformationWidget extends StatefulWidget {
  final String login;
  final String email;
  final int years;
  final String gender;

  const AccountInformationWidget(
      {Key? key,
      required this.login,
      required this.email,
      required this.years,
      required this.gender})
      : super(key: key);

  @override
  State<AccountInformationWidget> createState() =>
      _AccountInformationWidgetState();
}

class _AccountInformationWidgetState extends State<AccountInformationWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customText(Strings.login, widget.login),
        customText(Strings.email, widget.email),
        ageWidget(Strings.years, widget.years),
        genderWidget(Strings.gender, widget.gender),
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

  Widget ageWidget<T>(String info, T text) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$info: ${text.toString()}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            TextButton(
                onPressed: () {
                  showPickerNumber(context);
                },
                child: const Text(Strings.change))
          ],
        ));
  }

  // age picker
  showPickerNumber(BuildContext context) {
    final blocAccount = context.read<AccountViewModel>();
    Picker(
        confirmText: Strings.confirm,
        cancelText: Strings.cancel,
        adapter: NumberPickerAdapter(data: [
          const NumberPickerColumn(begin: 14, end: 100),
        ]),
        hideHeader: true,
        title: const Text(Strings.selectAge),
        selectedTextStyle: const TextStyle(color: Colors.blue),
        onConfirm: (Picker picker, List value) {
          final valueAge = picker.getSelectedValues().first as int;
          blocAccount.add(UpdateAgeEvent(age: valueAge));
        }).showDialog(context);
  }

  Widget genderWidget<T>(String info, T text) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$info: ${text.toString()}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            TextButton(
                onPressed: () {
                  showPickerGender(context);
                },
                child: const Text(Strings.change))
          ],
        ));
  }

  // gender picker
  showPickerGender(BuildContext context) {
    final blocAccount = context.read<AccountViewModel>();
    Picker(
        confirmText: Strings.confirm,
        cancelText: Strings.cancel,
        adapter: PickerDataAdapter<String>(
            pickerdata: const JsonDecoder().convert(Strings.pickerGender),
            isArray: true),
        hideHeader: true,
        title: const Text(Strings.selectGender),
        onConfirm: (Picker picker, List value) {
          final valueGender = picker.getSelectedValues().first as String;
          blocAccount.add(UpdateGenderEvent(gender: valueGender));
        }).showDialog(context);
  }
}

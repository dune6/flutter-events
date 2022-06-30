import 'package:flutter/material.dart';
import 'package:flutter_events/resources/constants.dart';
import 'package:provider/provider.dart';

import '../../../resources/strings.dart';
import '../view_model.dart';

class ToggleButtonsWidget extends StatefulWidget {
  const ToggleButtonsWidget({Key? key}) : super(key: key);

  @override
  State<ToggleButtonsWidget> createState() => ToggleButtonsState();
}

class ToggleButtonsState extends State<ToggleButtonsWidget> {
  static const borderRadiusToggleButton = 5.0;
  static const witchConstraintsToggleButton = 120.0;
  static const heightConstraintsToggleButton = 25.0;

  @override
  Widget build(BuildContext context) {
    final model = context.read<ViewModel>(); // read viewModel
    var arrSelected = [false, true];
    if (model.state.select == Constants.registrationPageNumber) {
      arrSelected = [false, true];
    } else {
      arrSelected = [true, false];
    }

    return ToggleButtons(
      borderRadius: BorderRadius.circular(borderRadiusToggleButton),
      constraints: const BoxConstraints.expand(
          width: witchConstraintsToggleButton,
          height: heightConstraintsToggleButton),
      children: const <Widget>[
        Text(Strings.entry),
        Text(Strings.registration),
      ],
      isSelected: arrSelected,
      onPressed: (int index) {
        model.changeToggleButton(index);
        setState(() {});
      },
    );
  }
}

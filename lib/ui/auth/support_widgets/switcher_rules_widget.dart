import 'package:flutter/cupertino.dart';

import '../../../resources/strings.dart';

class AgreeWithRules extends StatefulWidget {
  const AgreeWithRules({Key? key}) : super(key: key);

  @override
  State<AgreeWithRules> createState() => AgreeWithRulesState();
}

class AgreeWithRulesState extends State<AgreeWithRules> {
  static const horizontalPadding = 20.0;

  bool _switcherValue = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(Strings.agreeWithRules),
          CupertinoSwitch(
            value: _switcherValue,
            onChanged: (bool value) {
              setState(() {
                _switcherValue = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../resources/strings.dart';
import '../view_model.dart';

class AgreeWithRules extends StatefulWidget {
  const AgreeWithRules({Key? key}) : super(key: key);

  @override
  State<AgreeWithRules> createState() => AgreeWithRulesState();
}

class AgreeWithRulesState extends State<AgreeWithRules> {
  static const horizontalPadding = 20.0;

  @override
  Widget build(BuildContext context) {
    final model = context.read<ViewModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(Strings.agreeWithRules),
          CupertinoSwitch(
            value: model.state.isAgreeSwitch,
            onChanged: (bool value) {
              setState(() {
                model.switchAgree(value);
              });
            },
          ),
        ],
      ),
    );
  }
}

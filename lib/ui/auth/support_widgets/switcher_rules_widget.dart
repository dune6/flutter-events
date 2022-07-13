import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_events/resources/strings.dart';
import 'package:flutter_events/ui/auth/auth_events.dart';
import 'package:flutter_events/ui/auth/auth_state.dart';
import 'package:flutter_events/ui/auth/auth_view_model_bloc.dart';

class AgreeWithRules extends StatefulWidget {
  const AgreeWithRules({Key? key}) : super(key: key);

  @override
  State<AgreeWithRules> createState() => AgreeWithRulesState();
}

class AgreeWithRulesState extends State<AgreeWithRules> {
  static const horizontalPadding = 20.0;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthViewModelBloc>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(Strings.agreeWithRules),
          BlocBuilder<AuthViewModelBloc, AuthState>(
            builder: (context, state) {
              return CupertinoSwitch(
                value: state.isAgreeSwitch,
                onChanged: (bool value) {
                  setState(() {
                    bloc.add(SwitchAgreeEvent(value));
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

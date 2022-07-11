import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_events/ui/home/personal_events/personal_events_bloc.dart';

import '../../../resources/constants.dart';
import '../../../resources/strings.dart';
import '../../global_widgets/input_text_widget.dart';

class PersonalEventsWidget extends StatelessWidget {
  const PersonalEventsWidget({Key? key}) : super(key: key);

  static const _topPadding = 10.0;

  static Widget create() {
    return BlocProvider(
      create: (_) =>
          PersonalEventsViewModelBloc(const PersonalEventsState(findText: '')),
      child: const PersonalEventsWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final eventsBloc = context.read<PersonalEventsViewModelBloc>();

    return Scaffold(
        body: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: _topPadding),
          child: InputText(
              name: Strings.findEvents,
              func: (text) =>
                  eventsBloc.add(ChangeFindInputPersonalEvent(text)),
              obscureText: Constants.notObscure),
        ),
      ],
    ));
  }
}

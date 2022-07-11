import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_events/resources/constants.dart';
import 'package:flutter_events/ui/global_widgets/input_text_widget.dart';
import 'package:flutter_events/ui/home/events/events_bloc.dart';

import '../../../resources/strings.dart';

class EventsWidget extends StatelessWidget {
  const EventsWidget({Key? key}) : super(key: key);

  static const _topPadding = 10.0;

  static Widget create() {
    return BlocProvider(
      create: (_) => EventsViewModelBloc(const EventsState(findText: '')),
      child: const EventsWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final eventsBloc = context.read<EventsViewModelBloc>();

    return Scaffold(
        body: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: _topPadding),
          child: InputText(
              name: Strings.findEvents,
              func: (text) => eventsBloc.add(ChangeFindInputEvent(text)),
              obscureText: Constants.notObscure),
        ),
      ],
    ));
  }
}

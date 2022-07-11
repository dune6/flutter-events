import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_events/resources/constants.dart';
import 'package:flutter_events/ui/global_widgets/event_widget.dart';
import 'package:flutter_events/ui/global_widgets/input_text_widget.dart';
import 'package:flutter_events/ui/home/events/events_bloc.dart';

import '../../../resources/strings.dart';

class EventsWidget extends StatelessWidget {
  const EventsWidget({Key? key}) : super(key: key);

  static const _topInputPadding = 10.0;
  static const _topListPadding = 15.0;

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
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: _topInputPadding),
          child: InputText(
              name: Strings.findEvents,
              func: (text) => eventsBloc.add(ChangeFindInputEvent(text)),
              obscureText: Constants.notObscure),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: _topListPadding),
            child: ListView.separated(
              itemCount: 20,
              separatorBuilder: (_, index) => const Divider(
                height: 10,
              ),
              itemBuilder: (BuildContext context, int index) {
                return const EventWidget(
                  name: 'Вечерний боулинг',
                  place: 'Муссон',
                  dateTime: '19:00 15 октября',
                );
              },
            ),
          ),
        )
      ],
    ));
  }
}

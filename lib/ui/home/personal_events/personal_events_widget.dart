import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_events/resources/constants.dart';
import 'package:flutter_events/resources/strings.dart';
import 'package:flutter_events/ui/global_widgets/event_widget.dart';
import 'package:flutter_events/ui/global_widgets/input_text_widget.dart';
import 'package:flutter_events/ui/home/personal_events/personal_events_bloc.dart';

class PersonalEventsWidget extends StatelessWidget {
  const PersonalEventsWidget({Key? key}) : super(key: key);

  static const _topInputPadding = 10.0;
  static const _topListPadding = 15.0;

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
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: _topInputPadding),
          child: InputText(
              name: Strings.findEvents,
              func: (text) =>
                  eventsBloc.add(ChangeFindInputPersonalEvent(text)),
              obscureText: Constants.notObscure),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: _topListPadding),
            child: ListView.separated(
              itemCount: 5,
              separatorBuilder: (_, index) => const Divider(
                height: 10,
              ),
              itemBuilder: (BuildContext context, int index) {
                return const EventWidget(
                  name: 'Мои очень важные события',
                  place: 'Где-то',
                  dateTime: '16:00 32 октября',
                );
              },
            ),
          ),
        )
      ],
    ));
  }
}

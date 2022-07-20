import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_events/di/global_factory.dart';
import 'package:flutter_events/resources/constants.dart';
import 'package:flutter_events/resources/strings.dart';
import 'package:flutter_events/ui/global_widgets/event_widget.dart';
import 'package:flutter_events/ui/global_widgets/input_text_widget.dart';
import 'package:flutter_events/ui/home/personal_events/personal_events_view_model.dart';

class PersonalEventsWidget extends StatelessWidget {
  const PersonalEventsWidget({Key? key}) : super(key: key);

  static const _topInputPadding = 10.0;
  static const _topListPadding = 15.0;

  static Widget create() {
    return BlocProvider(
      create: (_) => PersonalEventsViewModel(
          const PersonalEventsState(findText: '', events: []),
          authService: GlobalFactory().authService())
        ..add(GetAccountEventsEvent()),
      child: const PersonalEventsWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final eventsViewModelBloc = context.watch<PersonalEventsViewModel>();

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: _topInputPadding),
            child: InputText(
                name: Strings.findEvents,
                func: (text) =>
                    eventsViewModelBloc.add(ChangeFindInputPersonalEvent(text)),
                obscureText: Constants.notObscure),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: _topListPadding),
              child: ListView.separated(
                itemCount: eventsViewModelBloc.state.events.length,
                separatorBuilder: (_, index) => const Divider(
                  height: 10,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return EventWidget(
                    name: eventsViewModelBloc.state.events[index].text,
                    place: eventsViewModelBloc.state.events[index].place,
                    dateTime: eventsViewModelBloc.state.events[index].time,
                    event: DeleteEvent(index),
                    bloc: eventsViewModelBloc,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

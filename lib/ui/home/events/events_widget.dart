import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_events/resources/constants.dart';
import 'package:flutter_events/resources/strings.dart';
import 'package:flutter_events/ui/global_widgets/event_widget.dart';
import 'package:flutter_events/ui/global_widgets/input_text_widget.dart';
import 'package:flutter_events/ui/home/events/events_view_model.dart';

class EventsWidget extends StatelessWidget {
  const EventsWidget({Key? key}) : super(key: key);

  static const _topInputPadding = 10.0;
  static const _topListPadding = 15.0;
  static const _bottomListPadding = 15.0;
  static const _separatedHeight = 10.0;

  @override
  Widget build(BuildContext context) {
    final eventsViewModelBloc = context.watch<EventsViewModel>();

    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: _topInputPadding),
          child: InputText(
              name: Strings.findEvents,
              func: (text) =>
                  eventsViewModelBloc.add(ChangeFindInputEvent(text)),
              obscureText: Constants.notObscure),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
                top: _topListPadding, bottom: _bottomListPadding),
            child: RefreshIndicator(
              onRefresh: () => _refresh(eventsViewModelBloc),
              child: ListView.separated(
                itemCount: eventsViewModelBloc.state.filteredEvents.length,
                separatorBuilder: (_, index) => const Divider(
                  height: _separatedHeight,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return EventWidget(
                    name: eventsViewModelBloc.state.filteredEvents[index].text,
                    place: eventsViewModelBloc.state.filteredEvents[index].place,
                    dateTime: eventsViewModelBloc.state.filteredEvents[index].time,
                    event: AddEventToFavoritesEvent(
                        eventsViewModelBloc.state.filteredEvents[index]),
                    bloc: eventsViewModelBloc,
                  );
                },
              ),
            ),
          ),
        )
      ],
    ));
  }

  Future<void> _refresh(EventsViewModel bloc) {
    bloc.add(GetEventsEvent());
    return Future.delayed(Duration(seconds: 2));
  }
}

part of 'personal_events_view_model.dart';

@immutable
class PersonalEventsState {
  final String findText;
  final List<EventModel> events;
  final List<EventModel> filteredEvents;

  const PersonalEventsState(
      {required this.findText,
      required this.events,
      required this.filteredEvents});

  PersonalEventsState copyWith({
    String? findText,
    List<EventModel>? events,
    List<EventModel>? filteredEvents,
  }) {
    return PersonalEventsState(
      findText: findText ?? this.findText,
      events: events ?? this.events,
      filteredEvents: filteredEvents ?? this.filteredEvents,
    );
  }
}

part of 'personal_events_view_model.dart';

@immutable
class PersonalEventsState {
  final String findText;
  final List<EventModel> events;

  const PersonalEventsState({required this.findText, required this.events});

  PersonalEventsState copyWith({
    String? findText,
    List<EventModel>? events,
  }) {
    return PersonalEventsState(
      findText: findText ?? this.findText,
      events: events ?? this.events,
    );
  }
}

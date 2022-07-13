part of 'events_view_model.dart';

@immutable
class EventsState {
  final String findText;
  final List<EventModel> events;

  const EventsState({
    required this.findText,
    required this.events,
  });

  EventsState copyWith({
    String? findText,
    List<EventModel>? events,
  }) {
    return EventsState(
        findText: findText ?? this.findText, events: events ?? this.events);
  }
}

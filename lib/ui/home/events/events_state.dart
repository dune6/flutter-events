part of 'events_view_model.dart';

@immutable
class EventsState {
  final String findText;
  final List<EventModel> events;
  final List<EventModel> filteredEvents;

  const EventsState({
    required this.findText,
    required this.events,
    required this.filteredEvents,
  });

  EventsState copyWith({
    String? findText,
    List<EventModel>? filteredEvents,
    List<EventModel>? events,
  }) {
    return EventsState(
        findText: findText ?? this.findText,
        filteredEvents: filteredEvents ?? this.filteredEvents,
        events: events ?? this.events);
  }
}

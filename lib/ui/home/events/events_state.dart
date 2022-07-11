part of 'events_bloc.dart';

@immutable
class EventsState {
  final String findText;

  const EventsState({
    required this.findText,
  });

  EventsState copyWith({
    String? findText,
  }) {
    return EventsState(
      findText: findText ?? this.findText,
    );
  }
}

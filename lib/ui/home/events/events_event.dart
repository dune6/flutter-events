part of 'events_bloc.dart';

@immutable
abstract class EventsEvent {}

class ChangeFindInputEvent extends EventsEvent {
  final String text;

  ChangeFindInputEvent(this.text);

}

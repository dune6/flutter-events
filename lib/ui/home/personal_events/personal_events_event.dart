part of 'personal_events_bloc.dart';

@immutable
abstract class PersonalEventsEvent {}

class ChangeFindInputPersonalEvent extends PersonalEventsEvent {
  final String text;

  ChangeFindInputPersonalEvent(this.text);
}

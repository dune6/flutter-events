part of 'personal_events_view_model.dart';

@immutable
abstract class PersonalEventsEvent {}

class InputEvent extends PersonalEventsEvent {
  final String text;

  InputEvent(this.text);
}

class GetAccountEventsEvent extends PersonalEventsEvent {}

class DeleteEvent extends PersonalEventsEvent {
  final int index;

  DeleteEvent(this.index);
}

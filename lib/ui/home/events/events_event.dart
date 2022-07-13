part of 'events_view_model.dart';

@immutable
abstract class EventsEvent {}

class ChangeFindInputEvent extends EventsEvent {
  final String text;

  ChangeFindInputEvent(this.text);
}

class GetEventsEvent extends EventsEvent {}

class AddEventToFavoritesEvent extends EventsEvent {
  final EventModel eventModel;

  AddEventToFavoritesEvent(this.eventModel);
}

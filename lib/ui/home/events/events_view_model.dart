import 'package:bloc/bloc.dart';
import 'package:flutter_events/domain/entity/event/event_model.dart';
import 'package:flutter_events/domain/repository/auth_service/auth_service.dart';
import 'package:flutter_events/domain/repository/events_service/events_service.dart';
import 'package:meta/meta.dart';

part 'events_event.dart';

part 'events_state.dart';

class EventsViewModel extends Bloc<EventsEvent, EventsState> {
  final EventsService eventsService;
  final AuthService authService;

  EventsViewModel(EventsState eventsState,
      {required this.eventsService, required this.authService})
      : super(eventsState) {
    on<ChangeFindInputEvent>((event, emit) => changeFindInputText(event, emit));
    on<GetEventsEvent>((event, emit) => getEvents(emit));
    on<AddEventToFavoritesEvent>(
        (event, emit) => addEventToFavourite(event));
  }

  // обработка ввода текста в форме find event
  void changeFindInputText(ChangeFindInputEvent event, Emitter emit) {
    if (state.findText == event.text) {
      return;
    }
    emit(state.copyWith(
        findText: event.text,
        filteredEvents: state.events
            .where((EventModel movie) =>
                movie.text.toLowerCase().contains(event.text.toLowerCase()))
            .toList()));
  }

  void getEvents(Emitter emit) async {
    emit(state.copyWith(events: await eventsService.getEventsRestAPI()));
    if (state.filteredEvents.isEmpty && state.findText.isEmpty) {
      emit(state.copyWith(filteredEvents: state.events));
    }
  }

  void addEventToFavourite(AddEventToFavoritesEvent event) async {
    await authService.addEventToFavourite(event.eventModel);
  }
}

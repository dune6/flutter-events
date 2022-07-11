import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'events_event.dart';

part 'events_state.dart';

class EventsViewModelBloc extends Bloc<EventsEvent, EventsState> {
  EventsViewModelBloc(EventsState eventsState) : super(eventsState) {
    on<ChangeFindInputEvent>((event, emit) => changeFindInputText(event, emit));
  }

  // обработка ввода текста в форме find event
  void changeFindInputText(ChangeFindInputEvent event, Emitter emit) {
    if (state.findText == event.text) return;
    emit(state.copyWith(findText: event.text));
    // TODO some logic to draw list with elements contains find text
  }
}

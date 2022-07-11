import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'personal_events_event.dart';

part 'personal_events_state.dart';

class PersonalEventsViewModelBloc
    extends Bloc<PersonalEventsEvent, PersonalEventsState> {
  PersonalEventsViewModelBloc(PersonalEventsState personalEventsState)
      : super(personalEventsState) {
    on<ChangeFindInputPersonalEvent>(
        (event, emit) => changeFindInputText(event, emit));
  }

  // обработка ввода текста в форме find event
  void changeFindInputText(ChangeFindInputPersonalEvent event, Emitter emit) {
    if (state.findText == event.text) return;
    emit(state.copyWith(findText: event.text));
    // TODO some logic to draw list with elements contains find text
  }
}

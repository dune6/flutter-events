import 'package:bloc/bloc.dart';
import 'package:flutter_events/domain/entity/event/event_model.dart';
import 'package:flutter_events/domain/repository/auth_service/auth_service.dart';
import 'package:flutter_events/domain/repository/user/user_repository.dart';
import 'package:meta/meta.dart';

part 'personal_events_event.dart';

part 'personal_events_state.dart';

class PersonalEventsViewModel
    extends Bloc<PersonalEventsEvent, PersonalEventsState> {
  final AuthService authService;

  PersonalEventsViewModel(PersonalEventsState personalEventsState,
      {required this.authService})
      : super(personalEventsState) {
    on<ChangeInputEvent>((event, emit) => changeFindInputText(event, emit));
    on<DeleteEvent>((event, emit) => deleteBloc(event, emit));
    on<GetAccountEventsEvent>((event, emit) => getUserEvents(emit));
  }

  // обработка ввода текста в форме find event
  void changeFindInputText(ChangeInputEvent event, Emitter emit) {
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

  Future<void> getUserEvents(Emitter emit) async {
    final userEntity = await authService.currentUser();
    final userModel = UserRepository.userEntityToUserModel(userEntity);
    emit(state.copyWith(events: userModel.personalEvents));

    if (state.filteredEvents.isEmpty && state.findText.isEmpty) {
      emit(state.copyWith(filteredEvents: state.events));
    }
  }

  Future<void> deleteBloc(DeleteEvent event, Emitter emit) async {
    final userEntity = await authService.currentUser();
    final userModel = UserRepository.userEntityToUserModel(userEntity);
    userModel.personalEvents.removeAt(event.index);
    await authService.updateUserInfo(userModel);
    emit(state.copyWith(events: userModel.personalEvents));
  }
}

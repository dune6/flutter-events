import 'package:bloc/bloc.dart';
import 'package:flutter_events/domain/entity/event/event_model.dart';
import 'package:flutter_events/domain/entity/user/user_transformer.dart';
import 'package:flutter_events/domain/repository/auth_repository/auth_repository.dart';
import 'package:meta/meta.dart';

part 'personal_events_event.dart';

part 'personal_events_state.dart';

class PersonalEventsViewModel
    extends Bloc<PersonalEventsEvent, PersonalEventsState> {
  final AuthRepository authRepository;

  PersonalEventsViewModel(PersonalEventsState personalEventsState,
      {required this.authRepository})
      : super(personalEventsState) {
    on<InputEvent>((event, emit) => changeInputText(event, emit));
    on<DeleteEvent>((event, emit) => deleteEvent(event, emit));
    on<GetAccountEventsEvent>((event, emit) => getUserEvents(emit));
  }

  Future<void> getUserEvents(Emitter emit) async {
    final userEntity = await authRepository.currentUser();
    final userModel = UserRepository.userEntityToUserModel(userEntity);
    emit(state.copyWith(events: userModel.personalEvents));
    add(InputEvent(state.findText));
  }

  // обработка ввода текста в форме find event
  void changeInputText(InputEvent event, Emitter emit) {
    emit(state.copyWith(
        findText: event.text,
        filteredEvents: state.events
            .where((EventModel movie) =>
                movie.text.toLowerCase().contains(event.text.toLowerCase()))
            .toList()));
  }

  Future<void> deleteEvent(DeleteEvent event, Emitter emit) async {
    final userEntity = await authRepository.currentUser();
    final userModel = UserRepository.userEntityToUserModel(userEntity);
    userModel.personalEvents.removeAt(event.index);
    await authRepository.updateUserInfo(userModel);
    add(GetAccountEventsEvent());
  }
}

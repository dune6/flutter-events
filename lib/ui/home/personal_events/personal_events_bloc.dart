import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'personal_events_event.dart';
part 'personal_events_state.dart';

class PersonalEventsBloc extends Bloc<PersonalEventsEvent, PersonalEventsState> {
  PersonalEventsBloc() : super(PersonalEventsInitial()) {
    on<PersonalEventsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

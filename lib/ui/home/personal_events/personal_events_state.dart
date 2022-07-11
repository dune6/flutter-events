part of 'personal_events_bloc.dart';

@immutable
class PersonalEventsState {
  final String findText;

  const PersonalEventsState({
    required this.findText,
  });

  PersonalEventsState copyWith({
    String? findText,
  }) {
    return PersonalEventsState(
      findText: findText ?? this.findText,
    );
  }
}

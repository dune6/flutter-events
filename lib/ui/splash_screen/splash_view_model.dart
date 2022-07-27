import 'package:bloc/bloc.dart';
import 'package:flutter_events/domain/repository/auth_repository/auth_repository.dart';
import 'package:flutter_events/exceptions/session_provider_exception.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashViewModel extends Bloc<SplashEvent, SplashState> {
  final AuthRepository authRepository;

  SplashViewModel(SplashState initial, {required this.authRepository})
      : super(initial) {
    on<SplashCheckAuth>((event, emit) => checkAuth(emit));
    on<ChangeAuthSplash>((event, emit) => changeAuthed(emit));
    add(SplashCheckAuth()); // вызываем проверку авторизации при создании блока
  }

  void changeAuthed(Emitter emit) => emit(state.copyWith(isAuth: false));

  Future<void> checkAuth(Emitter emit) async {
    try {
      await authRepository.checkAuth();
      emit(state.copyWith(isAuth: true));
    } on SessionProviderLoginDoesNotExistException {
      emit(state.copyWith(isAuth: false));
    }
  }
}

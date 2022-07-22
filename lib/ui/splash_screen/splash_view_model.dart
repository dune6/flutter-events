import 'package:bloc/bloc.dart';
import 'package:flutter_events/domain/repository/auth_service/auth_service.dart';
import 'package:flutter_events/exceptions/session_provider_exception.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashViewModel extends Bloc<SplashEvent, SplashState> {
  final AuthService authService;

  SplashViewModel(SplashState initial, {required this.authService})
      : super(initial) {
    on<SplashCheckAuth>((event, emit) => checkAuth(emit));
    on<ChangeAuthSplash>((event, emit) => changeAuthed(emit));
    add(SplashCheckAuth()); // вызываем проверку авторизации при создании блока
  }

  void changeAuthed(Emitter emit) => emit(state.copyWith(isAuth: false));

  Future<void> checkAuth(Emitter emit) async {
    try {
      await authService.checkAuth();
      emit(state.copyWith(isAuth: true));
    } on SessionProviderLoginDoesNotExistException {
      emit(state.copyWith(isAuth: false));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/repository/auth_service/auth_service.dart';
import '../../exceptions/session_provider_exception.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashViewModelBloc extends Bloc<SplashEvent, SplashState> {
  final AuthService _authService = AuthService();

  SplashViewModelBloc(SplashState initial) : super(initial) {
    on<SplashCheckAuth>((event, emit) => checkAuth(emit));
    on<ChangeAuthSplash>((event, emit) => changeAuthed(emit));
    add(SplashCheckAuth()); // вызываем проверку авторизации при создании блока
  }

  void changeAuthed(Emitter emit) => emit(state.copyWith(isAuth: false));

  Future<void> checkAuth(Emitter emit) async {
    try {
      await _authService.checkAuth();
      emit(state.copyWith(isAuth: true));
    } on SessionProviderLoginDoesNotExistException {
      emit(state.copyWith(isAuth: false));
    }
  }
}

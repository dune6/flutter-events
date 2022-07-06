import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/repository/auth_service/auth_service.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashViewModelBloc extends Bloc<SplashEvent, SplashState> {
  final AuthService _authService = AuthService();

  SplashViewModelBloc(SplashState initial) : super(initial) {
    on<SplashCheckAuth>((event, emit) => checkAuth(emit));
    add(SplashCheckAuth()); // вызываем проверку авторизации при создании блока
  }

  Future<void> checkAuth(Emitter emit) async {
    if (await _authService.checkAuth()) {
      emit(state.copyWith(isAuth: true));
    } else {
      emit(state.copyWith(isAuth: false));
    }
  }
}

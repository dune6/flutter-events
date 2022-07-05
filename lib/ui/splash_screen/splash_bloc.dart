import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashViewModelBloc extends Bloc<SplashEvent, SplashState> {
  SplashViewModelBloc(SplashState initial) : super(initial) {
    on<SplashCheckAuth>((event, emit) => checkAuth(event, emit));
    add(SplashCheckAuth()); // вызываем проверку авторизации при создании блока
  }

  void checkAuth(SplashCheckAuth event, Emitter emit) {
    // TODO communicate with AuthService bloc
    emit(state.copyWith(isAuth: false)); // mock
  }
}

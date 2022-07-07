import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_events/domain/repository/auth_service/auth_service.dart';
import 'package:meta/meta.dart';

import '../../exceptions/home_exceptions.dart';

part 'home_event.dart';

part 'home_state.dart';

abstract class HomeException {}

class LogoutException extends HomeException {}

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AuthService _authService = AuthService();

  HomeBloc(HomeState init) : super(init) {
    on<LogoutEventHome>((event, emit) => logout(emit));
    on<LogoutEvent>((event, emit) => logout(emit));
  }

  Future<void> logout(Emitter emit) async {
    if (state.isAuth == true) {
      await _authService.logout();
      emit(state.copyWith(isAuth: false));
    } else {
      throw LoginException();
      throw LogoutException();
    }
  }
}

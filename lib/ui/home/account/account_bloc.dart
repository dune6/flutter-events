import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_events/domain/entity/user/user_model.dart';
import 'package:flutter_events/domain/repository/auth_service/auth_service.dart';
import 'package:flutter_events/domain/repository/user/user_repository.dart';
import 'package:flutter_events/exceptions/account_exceptions.dart';
import 'package:meta/meta.dart';

part 'account_events.dart';

part 'account_state.dart';

class AccountViewModelBloc extends Bloc<AccountEvent, AccountState> {
  final AuthService _authService = AuthService();

  AccountViewModelBloc(AccountState init) : super(init) {
    on<AccountLogoutEvent>((event, emit) => logout(emit));
    on<AccountGetUserEvent>((event, emit) => getUser(emit));
  }

  Future<void> logout(Emitter emit) async {
    if (state.isAuth == true) {
      await _authService.logout();
      emit(state.copyWith(isAuth: false));
    } else {
      throw AccountLogoutException();
    }
  }

  Future<void> getUser(Emitter emit) async {
    final userEntity = await _authService.getUserByApiKey();
    final userModel = UserRepository.userEntityToUserModel(userEntity);
    emit(state.copyWith(userModel: userModel));
  }
}

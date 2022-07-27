import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_events/domain/entity/user/user_model.dart';
import 'package:flutter_events/domain/repository/auth_repository/auth_repository.dart';
import 'package:flutter_events/domain/entity/user/user_transformer.dart';
import 'package:flutter_events/exceptions/account_exceptions.dart';
import 'package:meta/meta.dart';

part 'account_events.dart';

part 'account_state.dart';

class AccountViewModel extends Bloc<AccountEvent, AccountState> {
  final AuthRepository authRepository;

  AccountViewModel(AccountState init, {required this.authRepository})
      : super(init) {
    on<AccountLogoutEvent>((event, emit) => logout(emit));
    on<AccountGetUserEvent>((event, emit) => getUser(emit));
    on<UpdateAgeEvent>((event, emit) => updateUserAge(event, emit));
    on<UpdateGenderEvent>((event, emit) => updateUserGender(event, emit));
  }

  Future<void> logout(Emitter emit) async {
    if (state.isAuth == true) {
      await authRepository.logout();
      emit(state.copyWith(isAuth: false));
    } else {
      throw AccountLogoutException();
    }
  }

  Future<void> getUser(Emitter emit) async {
    final userEntity = await authRepository.currentUser();
    final userModel = UserRepository.userEntityToUserModel(userEntity);
    emit(state.copyWith(userModel: userModel));
  }

  Future<void> updateUserAge(UpdateAgeEvent event, Emitter emit) async {
    final currentUser = state.userModel;
    await authRepository.updateUserInfo(currentUser.copyWith(years: event.age));
    emit(state.copyWith(
        userModel: UserRepository.userEntityToUserModel(
            await authRepository.currentUser())));
  }

  Future<void> updateUserGender(UpdateGenderEvent event, Emitter emit) async {
    final currentUser = state.userModel;
    await authRepository
        .updateUserInfo(currentUser.copyWith(gender: event.gender));
    emit(state.copyWith(
        userModel: UserRepository.userEntityToUserModel(
            await authRepository.currentUser())));
  }
}

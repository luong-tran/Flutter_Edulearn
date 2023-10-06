import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/resources/data_state.dart';
import '../../domain/usecases/sign_out.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final SignOutUseCase _signOutUseCase;
  ProfileBloc(this._signOutUseCase) : super(const ProfileState()) {
    on<SignOutEvent>(_signOutEvent);
  }

  void _signOutEvent(SignOutEvent event, Emitter<ProfileState> emit) async {
    emit(SignOutLoadingState());
    final dataState = await _signOutUseCase();

    if (dataState is DataSuccess) {
      emit(SignOutLoadedState(dataState.data!));
      await Navigator.of(event.context)
          .pushNamedAndRemoveUntil('/sign_in', (route) => false);
    }

    if (dataState is DataFailed) {
      print(dataState.error!.message);
      if (dataState.error!.message.toString() == 'Exception: Unauthorized') {
        final prefs = await SharedPreferences.getInstance();
        await prefs.clear();
        await Navigator.of(event.context)
            .pushNamedAndRemoveUntil('/sign_in', (route) => false);
      }
      // try {
      //   final response = await _profileRepository.requestSignOut();
      //   emit(SignOutLoadedState(response));
      //   await Navigator.of(event.context)
      //       .pushNamedAndRemoveUntil('/sign_in', (route) => false);
      // } catch (e) {
      //   if (e.toString() == 'Exception: Unauthorized') {
      //     var prefs = await SharedPreferences.getInstance();
      //     await prefs.clear();
      //     await Navigator.of(event.context)
      //         .pushNamedAndRemoveUntil('/sign_in', (route) => false);
      //   }
      //   emit(SignOutErrorState(e.toString()));
      // }
    }
  }
}

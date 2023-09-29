import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/repos/profile_respository.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _profileRepository;
  ProfileBloc(this._profileRepository) : super(const ProfileState()) {
    on<SignOutEvent>(_signOutEvent);
  }

  void _signOutEvent(SignOutEvent event, Emitter<ProfileState> emit) async {
    emit(SignOutLoadingState());
    try {
      final response = await _profileRepository.requestSignOut();
      emit(SignOutLoadedState(response));
      await Navigator.of(event.context)
          .pushNamedAndRemoveUntil('/sign_in', (route) => false);
    } catch (e) {
      if (e.toString() == 'Exception: Unauthorized') {
        var prefs = await SharedPreferences.getInstance();
        await prefs.clear();
        await Navigator.of(event.context)
            .pushNamedAndRemoveUntil('/sign_in', (route) => false);
      }
      emit(SignOutErrorState(e.toString()));
    }
  }
}

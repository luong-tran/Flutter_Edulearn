import 'package:edu_learn_app/data/repositories/profile_respository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      Navigator.of(event.context)
          .pushNamedAndRemoveUntil("/sign_in", (route) => false);
    } catch (e) {
      emit(SignOutErrorState(e.toString()));
    }
  }
}

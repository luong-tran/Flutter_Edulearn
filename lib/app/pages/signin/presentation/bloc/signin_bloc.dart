import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:google_sign_in/google_sign_in.dart';

import '../../domain/repos/sign_in_respository.dart';
import 'signin_event.dart';
import 'signin_state.dart';

class SignInBloc extends Bloc<SignInEvents, SignInStates> {
  final SignInRepository _signInRepository;

  SignInBloc(this._signInRepository) : super(SignInStates()) {
    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>(_passwordEvent);

    on<SignInSubmitEvent>(_signInSubmitEvent);

    // on<SignInGoogleEvent>(_signInGoogleEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SignInStates> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInStates> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _signInSubmitEvent(
      SignInSubmitEvent event, Emitter<SignInStates> emit) async {
    emit(SignInLoadingState());
    try {
      final response =
          await _signInRepository.requestSignIn(event.email, event.password);
      emit(SignInLoadedState(response));
      var prefs = await SharedPreferences.getInstance();
      await prefs.setString('dataUser', json.encode(response.data));
      await prefs.setString('token', response.token ?? '');
      await Navigator.of(event.context)
          .pushNamedAndRemoveUntil('/application', (route) => false);
    } catch (e) {
      emit(SignInErrorState(e.toString()));
    }
  }

  // void _signInGoogleEvent(
  //     SignInGoogleEvent event, Emitter<SignInStates> emit) async {
  //   emit(SignInLoadingState());
  //   try {
  //     final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
  //     final GoogleSignInAuthentication gAuth = await gUser!.authentication;
  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: gAuth.accessToken,
  //       idToken: gAuth.idToken,
  //     );
  //     final userCredential =
  //         await FirebaseAuth.instance.signInWithCredential(credential);
  //     print(userCredential.credential?.token);
  //   } catch (e) {
  //     emit(SignInErrorState(e.toString()));
  //   }
  // }
}

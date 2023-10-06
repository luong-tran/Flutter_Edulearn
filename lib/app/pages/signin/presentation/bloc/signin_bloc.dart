import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../core/resources/data_state.dart';
import '../../data/models/user_model.dart';
import '../../domain/usecases/sign_in.dart';
import 'signin_event.dart';
import 'signin_state.dart';

class SignInBloc extends Bloc<SignInEvents, SignInStates> {
  final SignInUseCase _signInUseCase;

  SignInBloc(this._signInUseCase) : super(SignInStates()) {
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

    final dataState = await _signInUseCase(
        params: SignInRequire(event.email, event.password));

    if (dataState is DataSuccess) {
      print(dataState.data);
      emit(SignInLoadedState(dataState.data));
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('dataUser', json.encode(dataState.data?.data));
      await prefs.setString('token', dataState.data?.token ?? '');
      await Navigator.of(event.context)
          .pushNamedAndRemoveUntil('/application', (route) => false);
    }

    if (dataState is DataFailed) {
      print(dataState.error!.message);
      emit(SignInErrorState(dataState.error!));
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

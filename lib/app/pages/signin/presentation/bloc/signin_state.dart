import 'package:dio/dio.dart';

import '../../domain/entities/sign_in_entity.dart';

class SignInStates {
  final String email;
  final String password;

  SignInStates({this.email = '', this.password = ''});

  SignInStates copyWith({String? email, String? password}) {
    return SignInStates(
        email: email ?? this.email, password: password ?? this.password);
  }
}

class IsValidEmail extends SignInStates {}

class IsValidPassword extends SignInStates {}

class IsInValidEmail extends SignInStates {}

class IsInValidPassword extends SignInStates {}

class SignInLoadingState extends SignInStates {
  @override
  Object? get props => {};
}

class SignInLoadedState extends SignInStates {
  SignInLoadedState(this.entities);
  final SignInEntity? entities;

  @override
  List<Object?> get props => [entities];
}

class SignInErrorState extends SignInStates {
  SignInErrorState(this.error);
  final DioError? error;

  @override
  List<Object?> get props => [error];
}

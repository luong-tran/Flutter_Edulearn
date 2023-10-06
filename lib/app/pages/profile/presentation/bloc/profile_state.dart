import 'package:dio/dio.dart';

import '../../domain/entities/sign_out_entity.dart';

class ProfileState {
  const ProfileState();
}

class SignOutLoadingState extends ProfileState {
  @override
  Object? get props => {};
}

class SignOutLoadedState extends ProfileState {
  SignOutLoadedState(this.response);
  final SignOutEntity response;

  @override
  Object? get props => {response};
}

class SignOutErrorState extends ProfileState {
  SignOutErrorState(this.error);
  final DioError? error;

  @override
  List<Object?> get props => [error];
}

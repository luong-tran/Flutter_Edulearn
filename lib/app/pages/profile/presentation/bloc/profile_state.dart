import '../../data/models/sign_out_model.dart';

class ProfileState {
  const ProfileState();
}

class SignOutLoadingState extends ProfileState {
  @override
  Object? get props => {};
}

class SignOutLoadedState extends ProfileState {
  SignOutLoadedState(this.response);
  final SignOutResponse response;

  @override
  Object? get props => {response};
}

class SignOutErrorState extends ProfileState {
  SignOutErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}

import '../../data/models/user_model.dart';

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
  SignInLoadedState(this.response);
  final SignInResponse response;

  @override
  Object? get props => {response};
}

class SignInErrorState extends SignInStates {
  SignInErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}

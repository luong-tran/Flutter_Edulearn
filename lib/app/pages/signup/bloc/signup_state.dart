class SignUpStates {
  final String email;
  final String password;
  final String phone;

  SignUpStates({this.email = "", this.password = "", this.phone = ""});

  SignUpStates copyWith({String? email, String? password, String? phone}) {
    return SignUpStates(
        email: email ?? this.email,
        password: password ?? this.password,
        phone: phone ?? this.phone);
  }
}

class IsValidEmail extends SignUpStates {}

class IsValidPassword extends SignUpStates {}

class IsValidPhone extends SignUpStates {}

class IsInValidEmail extends SignUpStates {}

class IsInValidPassword extends SignUpStates {}

class IsInValidPhone extends SignUpStates {}

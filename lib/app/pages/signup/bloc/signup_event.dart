abstract class SignUpEvents {
  const SignUpEvents();
}

class EmailEvent extends SignUpEvents {
  final String email;
  const EmailEvent(this.email);
}

class PasswordEvent extends SignUpEvents {
  final String password;
  const PasswordEvent(this.password);
}

class PhoneNumberEvent extends SignUpEvents {
  final String phone;
  const PhoneNumberEvent(this.phone);
}

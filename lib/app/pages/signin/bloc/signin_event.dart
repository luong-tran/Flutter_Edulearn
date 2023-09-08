import 'package:flutter/material.dart';

abstract class SignInEvents {
  const SignInEvents();
}

class EmailEvent extends SignInEvents {
  final String email;
  const EmailEvent(this.email);
}

class PasswordEvent extends SignInEvents {
  final String password;
  const PasswordEvent(this.password);
}

class SignInSubmitEvent extends SignInEvents {
  final String email;
  final String password;
  final BuildContext context;
  const SignInSubmitEvent(this.email, this.password, this.context);
}

class SignInGoogleEvent extends SignInEvents {
  const SignInGoogleEvent();
}

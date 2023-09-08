import 'package:flutter_bloc/flutter_bloc.dart';

import 'signup_event.dart';
import 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvents, SignUpStates> {
  SignUpBloc() : super(SignUpStates()) {
    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>(_passwordEvent);

    on<PhoneNumberEvent>(_phoneNumberEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SignUpStates> emit) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    !regex.hasMatch(event.email)
        ? emit(IsValidEmail())
        : emit(IsInValidEmail());
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignUpStates> emit) {
    event.password.length <= 7
        ? emit(IsValidPassword())
        : emit(IsInValidPassword());
  }

  void _phoneNumberEvent(PhoneNumberEvent event, Emitter<SignUpStates> emit) {
    const pattern = r'^(?:[+0]9)?[0-9]{9,10}$';
    final regExp = RegExp(pattern);

    !regExp.hasMatch(event.phone)
        ? emit(IsValidPhone())
        : emit(IsInValidPhone());
  }
}

import 'package:flutter/material.dart';

abstract class ProfileEvent {
  const ProfileEvent();
}

class SignOutEvent extends ProfileEvent {
  final BuildContext context;
  const SignOutEvent(this.context);
}

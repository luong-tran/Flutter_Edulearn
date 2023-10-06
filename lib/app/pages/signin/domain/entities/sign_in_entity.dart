import 'package:equatable/equatable.dart';

import '../../data/models/user_model.dart';

class SignInEntity extends Equatable {
  final UserInfo? data;
  final String? token;

  const SignInEntity({this.data, this.token});

  @override
  List<Object?> get props {
    return [data, token];
  }
}

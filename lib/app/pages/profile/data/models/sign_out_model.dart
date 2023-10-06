import '../../domain/entities/sign_out_entity.dart';

class SignOutModel extends SignOutEntity {
  @override
  String? msg;

  SignOutModel({this.msg});

  SignOutModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['msg'] = msg;
    return data;
  }

  factory SignOutModel.fromEntity(SignOutEntity entity) {
    return SignOutModel(msg: entity.msg);
  }
}

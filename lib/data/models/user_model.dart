class SignInResponse {
  UserInfo? data;
  String? token;

  SignInResponse({this.data, this.token});

  SignInResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? UserInfo.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class SignOutResponse {
  String? msg;

  SignOutResponse({this.msg});

  SignOutResponse.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    return data;
  }
}

class UserInfo {
  String? role;
  String? sId;
  String? edu;
  int? age;
  int? phone;
  String? email;
  String? password;
  String? token;
  String? createdAt;
  String? updatedAt;
  int? iV;

  UserInfo(
      {this.role,
      this.sId,
      this.edu,
      this.age,
      this.phone,
      this.email,
      this.password,
      this.token,
      this.createdAt,
      this.updatedAt,
      this.iV});

  UserInfo.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    sId = json['_id'];
    edu = json['edu'];
    age = json['age'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
    token = json['token'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['role'] = role;
    data['_id'] = sId;
    data['edu'] = edu;
    data['age'] = age;
    data['phone'] = phone;
    data['email'] = email;
    data['password'] = password;
    data['token'] = token;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

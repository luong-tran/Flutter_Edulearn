import 'dart:convert';

import 'package:edu_learn_app/data/models/user_model.dart';
import 'package:http/http.dart';

class SignInRepository {
  String endpoint = 'https://edulearn-3owe.onrender.com/login';

  Future<SignInResponse> requestSignIn(String email, String password) async {
    Response response = await post(Uri.parse(endpoint),
        body: {"email": email, "password": password});
    if (response.statusCode == 200) {
      return SignInResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

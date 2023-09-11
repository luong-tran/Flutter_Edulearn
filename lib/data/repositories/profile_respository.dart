import 'dart:convert';

import 'package:edu_learn_app/data/models/user_model.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRepository {
  String endpoint = 'https://edulearn-3owe.onrender.com/logout';

  Future<SignOutResponse> requestSignOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    Response response =
        await post(Uri.parse(endpoint), headers: {'Cookie': "token=$token"});
    if (response.statusCode == 200) {
      await prefs.clear();
      return SignOutResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

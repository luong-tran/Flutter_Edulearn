import 'dart:convert';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/sign_out_model.dart';

class ProfileRepository {
  String endpoint = 'https://edulearn-3owe.onrender.com/logout';

  Future<SignOutResponse> requestSignOut() async {
    var prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var response =
        await post(Uri.parse(endpoint), headers: {'Cookie': 'token=$token'});
    if (response.statusCode == 200) {
      await prefs.clear();
      return SignOutResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

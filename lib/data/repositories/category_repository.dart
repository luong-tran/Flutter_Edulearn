import 'dart:convert';

import 'package:edu_learn_app/data/models/group_model.dart';
import 'package:http/http.dart';

class CategoryRepository {
  String endpoint = 'https://edulearn-3owe.onrender.com/group';

  Future<List<GroupResponse>> requestListGroup() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result
          .map<GroupResponse>((json) => GroupResponse.fromJson(json))
          .toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

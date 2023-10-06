import '../../../../../core/resources/data_state.dart';
import '../entities/sign_out_entity.dart';

// class ProfileRepository {
//   String endpoint = 'https://edulearn-3owe.onrender.com/logout';

//   Future<SignOutResponse> requestSignOut() async {
//     var prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token');
//     var response =
//         await post(Uri.parse(endpoint), headers: {'Cookie': 'token=$token'});
//     if (response.statusCode == 200) {
//       await prefs.clear();
//       return SignOutResponse.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception(response.reasonPhrase);
//     }
//   }
// }

abstract class ProfileRepository {
  Future<DataState<SignOutEntity>> signOutResponse();
}

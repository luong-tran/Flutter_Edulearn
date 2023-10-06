import 'dart:io';
import 'package:dio/dio.dart';

import '../../../../../core/resources/data_state.dart';
import '../../data/models/user_model.dart';
import '../../domain/entities/sign_in_entity.dart';
import '../../domain/repository/sign_in_respository.dart';
import '../data_sources/sign_in_api_service.dart';

class SignInRepositoryImpl extends SignInRepository {
  final SignInApiService _signInApiService;

  SignInRepositoryImpl(this._signInApiService);

  @override
  Future<DataState<SignInEntity>> signInResponse(SignInRequire require) async {
    try {
      final httpResponse = await _signInApiService.postSignIn(
          email: require.email, password: require.password);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioError(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioErrorType.response,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
  // String endpoint = 'https://edulearn-3owe.onrender.com/login';

  // Future<SignInResponse> requestSignIn(String email, String password) async {
  //   final response = await post(Uri.parse(endpoint),
  //       body: {'email': email, 'password': password});
  //   if (response.statusCode == 200) {
  //     return SignInResponse.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception(response.reasonPhrase);
  //   }
  // }
}

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/resources/data_state.dart';
import '../../domain/entities/sign_out_entity.dart';
import '../../domain/repos/profile_respository.dart';
import '../data_sources/profile_api_service.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileApiService _profileApiService;

  ProfileRepositoryImpl(this._profileApiService);

  @override
  Future<DataState<SignOutEntity>> signOutResponse() async {
    // TODO: implement signOutResponse
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final httpResponse =
          await _profileApiService.postSignIn(token: 'token=$token');

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        await prefs.clear();
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
}

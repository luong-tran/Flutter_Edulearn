import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants/constants.dart';
import '../models/sign_out_model.dart';
part 'profile_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class ProfileApiService {
  factory ProfileApiService(Dio dio) = _ProfileApiService;

  @POST('/logout')
  Future<HttpResponse<SignOutModel>> postSignIn(
      {@Header('Cookie') required String token});
}

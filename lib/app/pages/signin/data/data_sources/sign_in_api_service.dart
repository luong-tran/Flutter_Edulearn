import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants/constants.dart';
import '../models/user_model.dart';
part 'sign_in_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class SignInApiService {
  factory SignInApiService(Dio dio) = _SignInApiService;

  @POST('/login')
  Future<HttpResponse<SignInResponse>> postSignIn(
      {@Field('email') required String email,
      @Field('password') required String password});
}

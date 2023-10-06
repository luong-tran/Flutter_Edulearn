// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _SignInApiService implements SignInApiService {
  _SignInApiService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://edulearn-3owe.onrender.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<SignInResponse>> postSignIn(
      {required email, required password}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'email': email, 'password': password};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<SignInResponse>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/login',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SignInResponse.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}

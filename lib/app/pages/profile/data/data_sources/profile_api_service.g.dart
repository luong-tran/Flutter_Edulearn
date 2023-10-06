// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ProfileApiService implements ProfileApiService {
  _ProfileApiService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://edulearn-3owe.onrender.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<SignOutModel>> postSignIn({required token}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Cookie': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<SignOutModel>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/logout',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SignOutModel.fromJson(_result.data!);
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

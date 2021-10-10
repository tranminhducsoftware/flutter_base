import 'package:dio/dio.dart';
import 'dart:async';

import 'package:flutter_base/src/constants/api_path.dart';
import 'package:flutter_base/src/core/models/token.dart';
import 'package:flutter_base/src/utils/services/secure_storage_service.dart';

class Client {
  Dio init() {
    Dio dio = new Dio();
    dio.interceptors.add(new ApiInterceptors(dio: dio));
    dio.options.baseUrl = ApiPath.hostUrl;
    return dio;
  }
}

class ApiInterceptors extends Interceptor {
  final Dio dio;

  ApiInterceptors({required this.dio});

  // gọi lại refresh token
  Future<String?> refreshToken() async {
    final token = await SecureStorage.getToken();
    if (token == null) return null;
    final refreshToken = token.refreshToken;

    Response resAccessToken =
        await dio.post(ApiPath.refreshTokenUrl, queryParameters: {
      'refreshToken': refreshToken,
    });

    if (resAccessToken.statusCode == 200) {
      String accessToken = resAccessToken.data["result"]["accessToken"];

      final newToken =
          Token(refreshToken: refreshToken, accessToken: accessToken);
      await SecureStorage.persistToken(newToken);
      return accessToken;
    }
  }

  // trc khi api được gọi
  @override
  Future<dynamic> onRequest(RequestOptions options) async {
    // do something before request is sent
    options.headers['content-type'] = 'application/json';
    options.headers["X-Requested-With"] = "XMLHttpRequest";

    if (await SecureStorage.hasToken()) {
      var token = await SecureStorage.getToken();
      if (token != null) {
        options.headers['Authorization'] = 'Bearer ' + token.accessToken;
      }
    }

    return options;
  }

  @override
  Future<dynamic> onError(DioError error) async {
    if (error.response?.statusCode == 403) {
      dio.interceptors.requestLock.lock();
      dio.interceptors.responseLock.lock();
      RequestOptions options = error.response.request;
      var accessToken = await refreshToken();
      dio.interceptors.requestLock.unlock();
      dio.interceptors.responseLock.unlock();
      if (accessToken == null) return error.response;

      options.headers["Authorization"] = "Bearer " + accessToken;
      return dio.request(options.path, options: options);
    }
    return error.response;
  }

  // trc khi api nhả ra
  @override
  Future<dynamic> onResponse(Response response) async {
    // do something before response
  }
}

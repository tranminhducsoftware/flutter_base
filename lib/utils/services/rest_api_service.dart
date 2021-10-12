import 'package:dio/dio.dart';
import 'dart:async';

import 'package:flutter_base/constants/api_path.dart';
import 'package:flutter_base/models/token.dart';
import 'package:flutter_base/utils/services/secure_storage_service.dart';

class HttpClient {
  Dio init() {
    Dio dio = new Dio();
    dio.interceptors.add(new CustomInterceptor(dio: dio));
    dio.options.baseUrl = ApiPath.HOST_DEV;
    return dio;
  }
}

class CustomInterceptor extends Interceptor {
  final Dio dio;

  CustomInterceptor({required this.dio});

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
    // if (error.type == DioErrorType.RECEIVE_TIMEOUT ||
    //     error.type == DioErrorType.CONNECT_TIMEOUT) {
    //   throw TimeoutException();
    // } else if (error.type == DioErrorType.RESPONSE) {
    //   switch (error.response.statusCode) {
    //     case 401:
    //       throw UnauthorizedException();
    //     case 403:
    //       throw ForbiddenException();
    //     case 404:
    //       throw NotFoundException();
    //     case 500:
    //       throw InternalServerError(message: error.message);
    //   }
    // } else {
    //   return error;
    // }
    if (error.response?.statusCode == 403) {
      dio.lock();
      dio.interceptors.responseLock.lock();
      RequestOptions options = error.response.request;
      var accessToken = await refreshToken();
      dio.unlock();
      dio.interceptors.responseLock.unlock();
      if (accessToken == null) return error.response;

      options.headers["Authorization"] = "Bearer " + accessToken;
      return dio.request(options.path, options: options);
    }
    return error.response;
  }

  @override
  Future<dynamic> onResponse(Response response) async {
    // xử lý bước cuối trước khi trả ra dữ liệu cho người dùng
  }
}

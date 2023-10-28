import 'dart:async';
import 'dart:io';

import 'package:base_api/api/api_exception.dart';
import 'package:base_api/common/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'authorization_interceptor.dart';
import 'model/api_response.dart';

// TODO: INJECT THIS
final dio = Dio();

abstract class BaseMarvelApiClient {
  static const TIME_OUT = 5000;
  late String _baseUrl = "https://gateway.marvel.com/v1/public";

  BaseMarvelApiClient() {
    dio.options.connectTimeout = TIME_OUT;
    dio.interceptors.add(AuthorizationInterceptor());
    dio.interceptors.add(PrettyDioLogger());
  }

  @protected
  Future<ApiResponse> get(
      {required String endpoint,
      Map<String, String>? queryParams,
      String? token}) async {
    final String url = _buildUrl(endpoint: endpoint, queryParams: queryParams);
    Map<String, dynamic>? requestHeader = _buildHeaders(token: token);
    try {
      final response =
          await dio.get(url, options: Options(headers: requestHeader));
      return _handleResponse(response);
    } on ApiException catch (e) {
      throw e;
    } on DioError catch (e) {
      print(e);
      if (e is SocketException) {
        throw FetchDataException("No internet connection", url.toString());
      }
      throw FetchDataException(e.message);
    } catch (e) {
      throw FetchDataException(
          "Something is wrong with your request! $e", url.toString());
    }
  }

  @protected
  Future<ApiResponse> post(
      {required String endpoint,
      Map<String, String>? queryParams,
      String? token}) async {
    final String url = _buildUrl(endpoint: endpoint, queryParams: queryParams);
    Map<String, dynamic>? requestHeader = _buildHeaders(token: token);
    try {
      var formData = FormData.fromMap({
        'name': 'wendux',
        'age': 25,
      });
      final response = await dio.post(url,
          options: Options(headers: requestHeader), data: formData);
      return _handleResponse(response);
    } on ApiException catch (e) {
      throw e;
    } on DioError catch (e) {
      print(e);
      if (e is SocketException) {
        throw FetchDataException("No internet connection", url.toString());
      }
      throw FetchDataException(e.message);
    } catch (e) {
      throw FetchDataException(
          "Something is wrong with your request! $e", url.toString());
    }
  }

  ApiResponse _handleResponse(Response response) {
    Map<String, dynamic> body = Map<String, dynamic>();
    if (response.data.isNotEmpty) {
      final mockWrapper = {"data": response.data};
      body = mockWrapper;
    }
    final apiResponse = ApiResponse(response.statusCode!, body);
    if (apiResponse.wasSuccessful()) {
      return apiResponse;
    } else {
      switch (response.statusCode) {
        case 400:
          throw BadRequestException(
              response.data["error"], response.realUri.toString());
        case 401:
        case 403:
          throw UnAuthorizedException(
              response.data["error"], response.realUri.toString());
        default:
          throw FetchDataException(
              "Error occurred with code: ${response.statusCode}",
              response.realUri.toString());
      }
    }
  }

  // Creates a Map with the necessary headers for any request sent to our API
  Map<String, dynamic> _buildHeaders({String? token}) {
    Map<String, String>? headers = Map();

    headers[Constants.contentTypeHeader] = "application/json";

    if (token != null) {
      headers[Constants.authorizationHeader] = "Bearer $token";
    }

    return headers;
  }

  String _buildUrl({
    required String endpoint,
    Map<String, String>? queryParams,
  }) {
    var apiUri = Uri.parse(_baseUrl);
    final apiPath = apiUri.path + "/" + endpoint;
    final uri = Uri(
            scheme: apiUri.scheme,
            host: apiUri.host,
            path: apiPath,
            queryParameters: queryParams)
        .toString();
    return uri;
  }
}

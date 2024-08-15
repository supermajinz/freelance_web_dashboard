// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:dash/api%20integration/auth/token_service.dart';
import 'package:dash/api%20integration/failures.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final AuthTokenService _authTokenService;

  ApiService(
      {required String baseUrl, required AuthTokenService authTokenService})
      : _dio = Dio(BaseOptions(baseUrl: baseUrl)),
        _authTokenService = authTokenService {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        //const token =
        //  "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIwOTMzMzMzMzMzIiwiaWF0IjoxNzIzNjMxNjg0LCJleHAiOjE3MjM3MTgwODR9._Q7MTuNNKwmPMiXSxK2KYv_Ig1XwB5ZFfbrwtiozZoI"; //admin
        //    "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIwOTg2NDExNjI0IiwiaWF0IjoxNzIzNTc1NDEzLCJleHAiOjE3MjM2NjE4MTN9.kyQLAxDmcWLAMJi3jWoIuh5VPPPAJcSdVHv-5ReYktY";
        // "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIwOTg2NDExNjIxIiwiaWF0IjoxNzIzMzk4OTgxLCJleHAiOjE3MjM0ODUzODF9.VnjjhGZc5VlW4KB_qS3a0DyatmvloiMDjctHCMR9ec8";
        final token = await _authTokenService.getToken('access_token');
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onError: (DioException error, handler) async {
        if (error.response?.statusCode == 401) {
          if (await refreshToken()) {
            final options = error.requestOptions;
            final retryResponse = await _retry(options);
            return handler.resolve(retryResponse);
          }
        }
        return handler.next(error);
      },
    ));
  }

  Future<Map<String, dynamic>> get(String endpoint,
      {Map<String, dynamic>? params}) async {
    try {
      print(
          "performing get request: $endpoint${params != null ? " ,params: $params" : ""}");
      final response = await _dio.get(endpoint, queryParameters: params);
      if (response.data is int) {
        return {'data': response.data};
      }
      if (response.data is List) {
        return {'data': response.data};
      }
      print("get request $endpoint response: ${response.data}");
      return response.data;
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      print('Response data: ${e.response?.data}');
      print('Response statusCode: ${e.response?.statusCode}');
      throw ServerFailure.fromDioException(e);
    }
  }

  Future<Map<String, dynamic>> post(
      String endpoint, Map<String, dynamic> data) async {
    try {
      print("performing post request: $endpoint");
      print('api service post: $data');
      final response = await _dio
          .post(endpoint, data: data)
          .timeout(const Duration(seconds: 30)); // Add timeout
      print("post request $endpoint response: ${response.data}");
      if (response.data is String) {
        return {'message': response.data};
      }
      return response.data;
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      print('Response data: ${e.response?.data}');
      print('Response statusCode: ${e.response?.statusCode}');
      throw ServerFailure.fromDioException(e);
    } on TimeoutException {
      throw ServerFailure(errMessage: 'Request timed out');
    }
  }

  Future<Map<String, dynamic>> put(
      String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _dio.put(endpoint, data: data);
      return response.data;
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      print('Response data: ${e.response?.data}');
      print('Response statusCode: ${e.response?.statusCode}');
      throw ServerFailure.fromDioException(e);
    }
  }

  Future<Map<String, dynamic>> patch(
      String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _dio.patch(endpoint, data: data);
      return response.data;
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      print('Response data: ${e.response?.data}');
      print('Response statusCode: ${e.response?.statusCode}');
      throw ServerFailure.fromDioException(e);
    }
  }

  Future<Map<String, dynamic>> delete(String endpoint) async {
    try {
      final response = await _dio.delete(endpoint);
      if (response is! Map<String, dynamic>) {
        return {"date": response};
      }
      return response.data;
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      print('Response data: ${e.response?.data}');
      print('Response statusCode: ${e.response?.statusCode}');
      throw ServerFailure.fromDioException(e);
    }
  }

  Future<bool> refreshToken() async {
    final refreshToken = await _authTokenService.getToken('refresh_token');
    if (refreshToken == null) return false;

    try {
      final response = await _dio.post(
        'auth/refresh-token',
        options: Options(headers: {'Authorization': 'Bearer $refreshToken'}),
      );
      await _authTokenService.saveToken(
          'access_token', response.data['access_token']);
      await _authTokenService.saveToken(
          'refresh_token', response.data['refresh_token']);
      return true;
    } catch (e) {
      await _authTokenService.deleteToken('access_token');
      await _authTokenService.deleteToken('refresh_token');
      return false;
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return _dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  Future<Map<String, dynamic>> postFormData(
      String endpoint, FormData formData) async {
    try {
      // print('Attempting to post to endpoint: $endpoint');
      //print('FormData: ${formData.fields}, ${formData.files}');
      //print('Base URL: ${_dio.options.baseUrl}');

      final response = await _dio.post(endpoint, data: formData);
      //print('API raw response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      //print('DioException in postFormData: ${e.type}');
      print('DioException message: ${e.message}');
      print('DioException response: ${e.response?.data}');

      if (e.response != null && e.response!.data is Map<String, dynamic>) {
        return e.response!.data;
      }

      return {
        'error': 'DioException',
        'message': e.message ?? 'Unknown error occurred'
      };
    } catch (e) {
      print('Unexpected error in postFormData: $e');
      return {'error': 'UnexpectedError', 'message': e.toString()};
    }
  }

  Future<Map<String, dynamic>> deletePost(
      String endpoint, Map<String, dynamic> data) async {
    try {
      print('performing delete with body');
      print("performing delete request: $endpoint");
      print('api service delete: $data');
      final response = await _dio.delete(endpoint, data: data);
      //final response = await _dio
      //  .delete(endpoint, data: {"clientProfileId": 102, "skillId": 2});
      print('delete response${response.toString()}');
      if (response.data is String) {
        // If the response is a string, wrap it in a Map
        return {'message': response.data};
      }

      return response.data;
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      print('Response data: ${e.response?.data}');
      print('Response statusCode: ${e.response?.statusCode}');
      throw ServerFailure.fromDioException(e);
    }
  }

  Future<void> deleteNoResponse(String endpoint) async {
    try {
      final response = await _dio.delete(endpoint);
      return response.data;
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      print('Response data: ${e.response?.data}');
      print('Response statusCode: ${e.response?.statusCode}');
      throw ServerFailure.fromDioException(e);
    }
  }
}

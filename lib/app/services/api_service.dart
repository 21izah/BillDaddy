import 'dart:io';

import 'package:dio/dio.dart';

import 'package:dio/io.dart';

import 'dart:convert'; // For custom transformers if needed

class ApiService {
  final Dio _dio;

  ApiService()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'https://egofinance-egofinance-be.pidagt.easypanel.host',
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 3),
            sendTimeout: const Duration(seconds: 3),
            headers: {
              'Accept': 'application/json',
            },
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
          ),
        ) {
    // Logging Interceptor
    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
      ),
    );

    // Request Interceptor
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] = 'Bearer YOUR_TOKEN';
          print('Request: ${options.method} ${options.uri}');
          return handler.next(options);
        },
      ),
    );

    // Response Interceptor
    _dio.interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, handler) {
          print('Response: ${response.statusCode} ${response.data}');
          return handler.next(response);
        },
      ),
    );

    // Error Interceptor
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException error, handler) {
          print('Error: ${error.message}');
          if (error.response?.statusCode == 401) {
            // Handle unauthorized error
            print('Unauthorized! Refreshing token...');
          }
          return handler.next(error);
        },
      ),
    );

    // SSL/TLS Configuration
    _dio.httpClientAdapter = IOHttpClientAdapter()
      ..createHttpClient = () {
        final client = HttpClient();
        client.badCertificateCallback = (cert, host, port) => true;
        return client;
      };

    // Custom Transformer
    _dio.transformer = BackgroundTransformer()
      ..jsonDecodeCallback = (json) => jsonDecode(json);
  }

  // GET Request
  Future<Response> get(String endpoint,
      {Map<String, dynamic>? queryParams}) async {
    return await _dio.get(endpoint, queryParameters: queryParams);
  }

  // POST Request
  Future<Response> post(String endpoint, {dynamic data}) async {
    print(data);
    return await _dio.post(endpoint, data: data);
  }

  // PUT Request
  Future<Response> put(String endpoint, {dynamic data}) async {
    return await _dio.put(endpoint, data: data);
  }

  // DELETE Request
  Future<Response> delete(String endpoint, {dynamic data}) async {
    return await _dio.delete(endpoint, data: data);
  }

  // Cancel Token Example
  CancelToken getCancelToken() => CancelToken();

  void cancelRequest(CancelToken cancelToken) {
    cancelToken.cancel('Request canceled');
  }

  // Multipart/Form-Data Example
  Future<Response> uploadFile(
      String endpoint, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
    return await _dio.post(endpoint, data: formData);
  }
}

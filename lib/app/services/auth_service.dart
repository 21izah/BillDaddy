import 'package:dio/dio.dart';
import 'api_service.dart';

class AuthService {
  final ApiService _apiService;

  AuthService(this._apiService);

  Future<Response> login(String email, String password) async {
    return await _apiService.post(
      '/user/auth/login',
      data: {'email': email, 'password': password},
    );
  }

  Future<Response> register(
    String fullName,
    String email,
    String phoneNumber,
    String password,
  ) async {
    return await _apiService.post(
      '/user/auth/signup',
      data: {
        'fullName': fullName,
        'email': email,
        'phoneNumber': phoneNumber,
        'password': password
      },
    );
  }
}

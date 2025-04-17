// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../services/api_service.dart';
// import '../services/auth_service.dart';

// class AuthControlller extends GetxController {
//   final AuthService _authService;

//   AuthProvider(this._authService);

//   bool _isLoading = false;
//   bool _isTermsAndConditionChecked = false;
//   String? _errorMessage;

//   bool get isLoading => _isLoading;
//   bool get isTermsAndConditionChecked => _isTermsAndConditionChecked;
//   String? get errorMessage => _errorMessage;

//   Future<bool> login(String email, String password) async {
//     _isLoading = true;
//     _errorMessage = null;
//     update();

//     try {
//       final result = await _authService.login(email, password);
//       // Handle successful login (e.g., save token, update user state)
//       _isLoading = false;
//       update();
//       return true;
//     } catch (e) {
//       _errorMessage = 'Login failed. Please try again.';
//       _isLoading = false;
//       update();
//       return false;
//     }
//   }

//   Future<bool> register(
//     String fullName,
//     String email,
//     String phoneNumber,
//     String password,
//   ) async {
//     _isLoading = true;

//     _errorMessage = null;
//     update();

//     try {
//       final result = await _authService.register(
//         fullName,
//         email,
//         phoneNumber,
//         password,
//       );
//       // Handle successful registration (e.g., save token, update user state)
//       _isLoading = false;
//       update();
//       return true;
//     } catch (e) {
//       _errorMessage = 'Registration failed. Please try again. ${e}';
//       _isLoading = false;
//       update();
//       return false;
//     }
//   }
// }

// // Riverpod Provider
// final authProvider = ChangeNotifierProvider<AuthProvider>((ref) {
//   final apiService = ApiService(); // Instantiate ApiService
//   final authService = AuthService(apiService); // Inject into AuthService
//   return AuthProvider(authService); // Provide AuthProvider
// });

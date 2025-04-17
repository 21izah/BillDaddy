import 'dart:io';

import 'package:get/get.dart';

class RegistrationOtpController extends GetxController {
  bool _isLoading = false;
  String message = '';

  bool get isLoading => _isLoading;

  final GetConnect _connect = GetConnect();

  Future<void> simulateOtpVerification(
    String email,
    String code,
    Function(String message) showSuccessMessage,
    Function(String message) showErrorMessage,
    Function() navigateToNextPage,
  ) async {
    // API endpoint URL
    final url =
        'https://egofinance-egofinance-be.pidagt.easypanel.host/user/auth/verify-identifier';

    // Request body
    final requestBody = {
      "email": email,
      "code": code,
    };

    final headers = {
      'Content-Type': 'application/json',
    };

    try {
      // Set loading state
      _isLoading = true;
      update();

      // Make the HTTP request using GetConnect
      final response = await _connect.post(
        url,
        requestBody,
        headers: headers,
      );

      // Process the response
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = response.body;
        print('$responseData');

        // Show success message and navigate
        showSuccessMessage('${responseData['message']}');
        navigateToNextPage();
      } else {
        final responseData = response.body;
        showErrorMessage('${responseData['message']}');
        print('${responseData['message']}');
      }
    } on SocketException catch (e) {
      showErrorMessage('No internet connection: ${e.message}');
    } catch (e) {
      showErrorMessage('No internet connection');
      // showErrorMessage('An unexpected error occurred: $e');
    } finally {
      // Reset loading state
      _isLoading = false;
      update();
    }
  }
}

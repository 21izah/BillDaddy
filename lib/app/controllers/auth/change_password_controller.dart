import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ChangePasswordController extends GetxController {
  bool _isLoading = false;
  String message = '';
  final box = GetStorage();

  bool get isLoading => _isLoading;

  final GetConnect _connect = GetConnect();

  Future<void> simulateChangePassword(
    String currentPassword,
    String newPassword,
    Function(String message) showSuccessMessage,
    Function(String message) showErrorMessage,
    Function() navigateToNextPage,
  ) async {
    // API endpoint URL
    final url =
        'https://egofinance-egofinance-be.pidagt.easypanel.host/user/auth/change-password';

    // Request body
    final requestBody = {
      "currentPassword": currentPassword,
      "newPassword": newPassword,
    };

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${box.read('BearerToken')}'
    };

    try {
      // Set loading state
      _isLoading = true;
      update();

      // Make the HTTP request using GetConnect
      final response = await _connect.put(
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

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class UpdateUserDetailsController extends GetxController {
  bool _isLoading = false;
  String message = '';
  final box = GetStorage();

  bool get isLoading => _isLoading;

  Future<void> fetchUserData() async {
    final url = Uri.parse(
        'https://egofinance-egofinance-be.pidagt.easypanel.host/users/${box.read('id')}');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${box.read('BearerToken')}'
    };

    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        var jsonData =
            convert.jsonDecode(response.body) as Map<String, dynamic>;
        var fullName = jsonData['data']['user']['fullName'];
        await box.write('fullName', jsonData['data']['user']['fullName']);
        print(' my fuulllanme is ${fullName}');
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

  Future<void> simulateUpdateUserDetails(
    String fullName,
    String email,
    String phoneNumber,
    Function(String message) showSuccessMessage,
    Function(String message) showErrorMessage,
    Function() navigateToNextPage,
  ) async {
    // API endpoint URL
    final url = Uri.parse(
        'https://egofinance-egofinance-be.pidagt.easypanel.host/users/${box.read('id')}');

    // Request body
    final requestBody = {
      "fullName": fullName,
      "email": email,
      "phoneNumber": phoneNumber,
    };

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${box.read('BearerToken')}'
    };

    try {
      // Set loading state
      _isLoading = true;
      update();

      // Make the HTTP request
      final response = await http.patch(
        url,
        body: convert.jsonEncode(requestBody),
        headers: headers,
      );

      // Process the response
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = convert.jsonDecode(response.body);
        print('$responseData');

        // Show success message and navigate
        showSuccessMessage('${responseData['message']}');
        navigateToNextPage();
      } else {
        final responseData = convert.jsonDecode(response.body);
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

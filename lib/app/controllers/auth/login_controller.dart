import 'dart:convert' as convert;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

import 'package:get/get.dart';

import '../../data/models/auth/userAccountModel.dart';

class LoginController extends GetxController {
  var userData = Rxn<UserData>(); // Reactive variable (null initially)
  bool _isLoading = false;
  bool _isScreentabEnabled = false;
  String message = '';
  final box = GetStorage();

  bool get isLoading => _isLoading;
  bool get isScreentabEnabled => _isScreentabEnabled;

  final GetConnect _connect = GetConnect();

  Future<void> fetchUserAccountData() async {
    print('account api called');
    final url = Uri.parse(
        'https://egofinance-egofinance-be.pidagt.easypanel.host/users/authenticated/user');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer ${box.read('BearerToken')}', // Ensure _username is defined
    };

    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        var responseData =
            convert.jsonDecode(response.body) as Map<String, dynamic>;

        // Extract user ID
        String userId = responseData['data']['user']['id'];

        print('account id ${userId}');

        // Extract wallets list
        List<dynamic> wallets = responseData['data']['user']['wallets'];

        print('account wallet ${wallets}');

        // Find PRIMARY wallet
        var primaryWallet = wallets.firstWhere(
          (wallet) => wallet['walletType'] == 'PRIMARY',
          orElse: () => null,
        );

        if (primaryWallet != null) {
          // Extract account details
          String accountNumber = primaryWallet['accountNumber'];
          String balance = primaryWallet['balance'];

          print('account account ${accountNumber}');
          print('account balance ${balance}');

          // Update state using Rx
          userData.value = UserData(
            id: userId,
            accountNumber: accountNumber,
            balance: balance,
          );
          print('account model account ${userData.value!.accountNumber}');
          print('account model balance ${userData.value!.balance}');
        } else {
          print('Primary wallet not found');
        }
      } else {
        print('Failed to fetch user data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

  Future<void> simulateLogin(
    String username,
    String password,
    String deviceToken,
    String deviceId,
    Function(String message) showSuccessMessage,
    Function(String message) showErrorMessage,
    // Function() navigateToNextPage,
  ) async {
    final url =
        'https://egofinance-egofinance-be.pidagt.easypanel.host/user/auth/login';
    final requestBody = {
      "username": username,
      "password": password,
      "deviceToken": deviceToken,
      "deviceId": deviceId
    };
    final headers = {'Content-Type': 'application/json'};

    int retryCount = 0;
    const maxRetries = 3;
    int delay = 1; // Initial delay in seconds

    while (retryCount < maxRetries) {
      try {
        _isLoading = true;

        update(); // Notify listeners immediately

        final response = await _connect.post(
          url,
          requestBody,
          headers: headers,
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          final responseData = response.body;
          print('my response data is $responseData');
          await box.write('BearerToken', responseData['data']['access_token']);
          await box.write('fullName', responseData['data']['user']['fullName']);
          await box.write(
              'phoneNumber', responseData['data']['user']['phoneNumber']);
          await box.write('id', responseData['data']['user']['id']);

          print('my id is ${box.read('id')}');

          showSuccessMessage('${responseData['message']}');
          // navigateToNextPage();
          return;
        } else if (response.statusCode! >= 500) {
          // Server-side error (retry)
          retryCount++;
          await Future.delayed(Duration(seconds: delay));
          delay *= 2; // Exponential backoff
          continue;
        } else {
          // Other errors (don't retry)
          final responseData = response.body;
          showErrorMessage('${responseData['message']}');
          break;
        }
      } on SocketException catch (e) {
        // Handle network issues
        if (retryCount < maxRetries) {
          retryCount++;
          await Future.delayed(Duration(seconds: delay));
          delay *= 2; // Increase delay for next attempt
        } else {
          showErrorMessage('No internet connection: ${e.message}');
          break;
        }
      } catch (e) {
        print('error $e');
        showErrorMessage('An unexpected error occurred: $e');
        break;
      } finally {
        _isLoading = false;
        update();
      }
    }
  }
}

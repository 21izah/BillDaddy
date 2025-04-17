import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

import '../../data/models/transfer/transactionDetailsModel.dart';
import '../../data/models/auth/userAccountModel.dart';
import '../../data/models/transfer/verifyAccountModel.dart';
import '../../data/models/transfer/verifyOwnerAccountModel.dart';

class TransferController extends GetxController {
  var userData = Rxn<UserData>(); // Reactive variable (null initially)
  var transactionDetails =
      Rxn<TransactionDetails>(); // Reactive variable (null initially)
  var accountDetails1 =
      Rxn<AccountDetails>(); // Reactive variable (null initially)
  var accountDetail2 =
      Rxn<AccountDetailss>(); // Reactive variable (null initially)
  bool _isLoading = false;

  bool _isGetBankListLoading = false;
  bool _isSuccessAndLoadingContainerShowing = false;
  bool _isFailuresContainerShowing = false;
  bool _isButtonEnabled = true;
  String message = '';
  final box = GetStorage();

  bool get isLoading => _isLoading;
  bool get isGetBankListLoading => _isGetBankListLoading;
  bool get isSuccessAndLoadingContainerShowing =>
      _isSuccessAndLoadingContainerShowing;
  bool get isFailuresContainerShowing => _isFailuresContainerShowing;
  bool get isButtonEnabled => _isButtonEnabled;

  List<bool> isCheckedList = [];

  String? selectedBankCode; // Track the selected bank by its code

  // Method to handle bank selection
  void selectBank(String bankCode) {
    selectedBankCode = bankCode;
    update();
  }

  //////////////////////////////////////////

  String? selectedBankName;

  void resetSelectedBank() {
    selectedBankCode = null;
    selectedBankName = null;
    update();
  }
  /////////////////////////////////////////

  void resetTransferState() {
    _isSuccessAndLoadingContainerShowing = false;
    _isFailuresContainerShowing = false;
    _isButtonEnabled = true;
    update();
  }

  Future<void> simulateTransferToEgoFinaceAccount(
    String senderWalletId,
    String recipientAccountNumber,
    int amount,
    Function(String message) showSuccessMessage,
    Function(String message) showErrorMessage,
    Function() navigateToNextPage,
  ) async {
    // API endpoint URL
    final url = Uri.parse(
        'https://egofinance-egofinance-be.pidagt.easypanel.host/finances/send-money');

    // Request body
    final requestBody = {
      "senderWalletId": senderWalletId,
      "recipientAccountNumber": recipientAccountNumber,
      "amount": amount,
    };

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${box.read('BearerToken')}',
    };

    try {
      // Set loading state
      _isLoading = true;
      update();

      // Make the HTTP request
      final response = await http.post(
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
        final transactionDetails = TransactionResponse.fromJson(responseData);
        print('${transactionDetails.transactionDetails.amount}');

        // Store the data in the Provider

        // transactionDetails =
        //     ref.read(transactionDetailsProvider.notifier).state;
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

  // Future<void> simulateVerifyTransferToEgoFinaceAccount(
  //   String accountNumber,
  //   // Function(String message) showSuccessMessage,
  //   // Function(String message) showErrorMessage,
  // ) async {
  //   final url = Uri.parse(
  //       'https://egofinance-egofinance-be.pidagt.easypanel.host/finances/${accountNumber}/verify-wallet');

  //   final headers = {
  //     'Content-Type': 'application/json',
  //     'Authorization': 'Bearer ${box.read('BearerToken')}',
  //   };

  //   try {
  //     _isLoading = true;
  //     _isSuccessAndLoadingContainerShowing = true;
  //     _isFailuresContainerShowing = false;
  //     update();

  //     final response = await http.post(
  //       url,
  //       headers: headers,
  //     );

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       // Parse the JSON response
  //       final responseData = jsonDecode(response.body) as Map<String, dynamic>;

  //       // Convert the JSON to an AccountDetails object
  //       final accountDetails = AccountDetails.fromJson(responseData);
  //       print(
  //           'user wallet account number ${accountDetails.wallet.accountNumber}');
  //       print('user wallet account balance ${accountDetails.wallet.balance}');
  //       print('user wallet id ${accountDetails.wallet.id}');
  //       print('user wallet type ${accountDetails.wallet.walletType}');
  //       print('user wallet status ${accountDetails.wallet.status}');
  //       print('the user name ${accountDetails.user.name}');
  //       print('the user phone number ${accountDetails.user.phoneNumber}');

  //       final walletData = responseData['data']['wallet'];
  //       final userData = responseData['data']['user'];
  //       print('user data is $responseData');
  //       print('user name is ${userData['name']}');

  //       print('user name is ${userData['name']}');

  //       _isButtonEnabled = false;
  //       update();

  //       // Store the data in the Provider
  //       // ref.read(userAccountDetailsProvider.notifier).state = accountDetails;
  //       accountDetails1.value = AccountDetails(
  //         success: responseData['success'],
  //         message: responseData['message'],
  //         wallet: responseData['data']['wallet'],
  //         user: responseData['data']['user'],
  //       );

  //       update();

  //       // Show success message
  //       // showSuccessMessage('Wallet verified successfully');
  //     } else {
  //       // Handle API errors
  //       // Hide success container and show failure container
  //       _isSuccessAndLoadingContainerShowing = false;
  //       _isFailuresContainerShowing = true;
  //       _isButtonEnabled = true;

  //       update();
  //       // showErrorMessage(
  //       //     'Account Verification failed. Please check the details or try again');
  //       return;
  //     }
  //   } catch (e) {
  //     // Handle network or other errors
  //     // showErrorMessage('Error verifying wallet: $e');
  //     // Hide success container and show failure container
  //     _isSuccessAndLoadingContainerShowing = false;
  //     _isFailuresContainerShowing = true;
  //     _isButtonEnabled = true;

  //     update();

  //     return; // Exit to prevent resetting state prematurely
  //   } finally {
  //     // Reset loading state
  //     _isLoading = false;

  //     update();
  //   }
  // }

  Future<void> simulateVerifyTransferToEgoFinaceAccount(
    String accountNumber,
  ) async {
    final url = Uri.parse(
        'https://egofinance-egofinance-be.pidagt.easypanel.host/finances/${accountNumber}/verify-wallet');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${box.read('BearerToken')}',
    };

    try {
      _isLoading = true;
      _isSuccessAndLoadingContainerShowing = true;
      _isFailuresContainerShowing = false;
      update();

      final response = await http.post(
        url,
        headers: headers,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body) as Map<String, dynamic>;
        final accountDetails = AccountDetails.fromJson(responseData);

        accountDetails1.value = AccountDetails(
          success: responseData['success'],
          message: responseData['message'],
          wallet: responseData['data']['wallet'],
          user: responseData['data']['user'],
        );

        update();
      } else {
        _isSuccessAndLoadingContainerShowing = false;
        _isFailuresContainerShowing = true;
        _isButtonEnabled = true;
        update();
      }
    } catch (e) {
      _isSuccessAndLoadingContainerShowing = false;
      _isFailuresContainerShowing = true;
      _isButtonEnabled = true;
      update();
    } finally {
      _isLoading = false;
      update();
    }
  }

  Future<void> verifyOwnerAccount(
    String accountNumber,
  ) async {
    final url = Uri.parse(
        'https://egofinance-egofinance-be.pidagt.easypanel.host/finances/${accountNumber}/verify-wallet');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${box.read('BearerToken')}',
    };

    try {
      final response = await http.post(
        url,
        headers: headers,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Parse the JSON response
        final responseData = jsonDecode(response.body) as Map<String, dynamic>;
        print('$responseData');

        accountDetail2.value = AccountDetailss(
          success: responseData['success'],
          message: responseData['message'],
          wallet: responseData['data']['wallet'],
          user: responseData['data']['user'],
        );

        // Convert the JSON to an AccountDetails object
        final accountDetails = AccountDetailss.fromJson(responseData);

        // Store the data in the Provider
        // ref.read(ownerAccountDetailsProvider.notifier).state = accountDetails;
        print(
            'owner wallet account number ${accountDetails.wallet.accountNumber}');
        print('owner wallet account balance ${accountDetails.wallet.balance}');
        print('owner wallet id ${accountDetails.wallet.id}');
        print('owner wallet type ${accountDetails.wallet.walletType}');
        print('owner wallet status ${accountDetails.wallet.status}');
        print('the user name ${accountDetails.user.name}');
        print('the user phone number ${accountDetails.user.phoneNumber}');

        // Show success message
      } else {
        final responseData = convert.jsonDecode(response.body);

        print('${responseData['message']}');
      }
    } catch (e) {
      print('${e}');
    }
  }
}

import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

import '../../data/models/transfer/bankModel.dart';
import '../../data/models/transfer/transferToOtherBankDetails.dart';
import '../../data/models/transfer/verifiedBankNumberModel.dart';

class TransferToOtherBankController extends GetxController {
  // initializations..................................

  var bankListModel =
      Rxn<BankListModel>(); // Reactive variable (null initially)
  var transactionDetails =
      Rxn<TransactionDetails>(); // Reactive variable (null initially)
  var transferToOtherBankModel =
      Rxn<TransferToOtherBankModel>(); // Reactive variable (null initially)
  var verifiedBankNumberModel =
      Rxn<VerifiedBankNumberModel>(); // Reactive variable (null initially)

  bool _isLoading = false;
  bool _isGetBankListLoading = false;
  bool _isSuccessAndLoadingContainerShowing = false;
  bool _isFailuresContainerShowing = false;
  bool _isBankFailuresContainerShowing = false;
  bool _isButtonEnabled = true;

  String message = '';

  List<Map<String, dynamic>> _listOfBanks = [];
  List<Map<String, dynamic>> _filteredBanks = [];
  List<bool> _isCheckedList = [];

  // initializations..................................

  // Getters..................................

  bool get isLoading => _isLoading;
  bool get isGetBankListLoading => _isGetBankListLoading;
  bool get isSuccessAndLoadingContainerShowing =>
      _isSuccessAndLoadingContainerShowing;
  bool get isFailuresContainerShowing => _isFailuresContainerShowing;
  bool get isBankFailuresContainerShowing => _isBankFailuresContainerShowing;
  List<bool> get isCheckedList => _isCheckedList;
  bool get isButtonEnabled => _isButtonEnabled;
  List get listOfBanks => _listOfBanks;
  List get filteredBanks => _filteredBanks;

  // Public setter for isCheckedList
  set isCheckedList(List<bool> value) {
    _isCheckedList = value;
    update(); // Important to trigger UI updates if this list is used in the UI
  }

  final GetConnect _connect = GetConnect();
  final box = GetStorage();

  // Getters..................................

  // Functions and Setters....................

  void resetTransferState() {
    _isSuccessAndLoadingContainerShowing = false;
    _isFailuresContainerShowing = false;
    _isBankFailuresContainerShowing = false;
    _isButtonEnabled = true;

    update();
  }

  void runFilter(String enterKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enterKeyword.isEmpty) {
      // If the search keyword is empty, show all banks
      results = _listOfBanks;
    } else {
      // Filter the banks based on the search keyword
      results = _listOfBanks
          .where((bank) =>
              bank['name']!.toLowerCase().contains(enterKeyword.toLowerCase()))
          .toList();
    }

    // Update the filtered list and notify listeners
    _filteredBanks = results;
    update();
  }

  Future<void> simulateTransferToOtherBank(
    int? amount,
    String accountNumber,
    String recipientCode,
    String recipientName,
    String recipentBank,
    String walletId,
    String reason,
    String transactionPin,
    Function(String message) showSuccessMessage,
    Function(String message) showErrorMessage,
    Function() navigateToNextPage,
  ) async {
    // API endpoint URL
    final url = Uri.parse(
        'https://egofinance-egofinance-be.pidagt.easypanel.host/transfers/initiate-transfer');

    // Request body
    final requestBody = {
      "amount": amount,
      "accountNumber": accountNumber,
      "recipientCode": recipientCode,
      "recipientName": recipientName,
      "recipentBank": recipentBank,
      "walletId": walletId,
      "reason": reason,
      "transactionPin": transactionPin,
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
        final transferToOtherBankModel01 =
            TransferToOtherBankModel.fromJson(responseData);

        // Store the data in the Controller
        // ref.read(transferToOtherBankModel.notifier).state = transactionDetails;
        // Update state using Rx
        transferToOtherBankModel.value = TransferToOtherBankModel(
          success: responseData['success'],
          message: responseData['message'],
          data: responseData['data'],
        );
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

  Future<void> createTransferRecipient(
    String? bankCode,
    String accountNumber,
    // Function(String message) showSuccessMessage,
    // Function(String message) showErrorMessage,
    // Function() navigateToNextPage,
  ) async {
    // API endpoint URL
    final url = Uri.parse(
        'https://egofinance-egofinance-be.pidagt.easypanel.host/transfers/create-recipient');

    // Request body
    final requestBody = {"bankCode": bankCode, "accountNumber": accountNumber};

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${box.read('BearerToken')}',
    };

    try {
      // Set loading state
      _isLoading = true;
      _isSuccessAndLoadingContainerShowing = true;
      _isFailuresContainerShowing = false;
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
        print('kl $responseData');

        _isButtonEnabled = false;

        // Store the data in the Comtroller
        // Update state using Rx
        // verifiedBankNumberModel.value = VerifiedBankNumberModel(
        //   status: responseData['success'],
        //   message: responseData['message'],
        //   data: responseData['data'],
        // );
        // Show success message and navigate
        // showSuccessMessage('${responseData['message']}');
        final verifiedBankNumberModel01 =
            VerifiedBankNumberModel.fromJson(responseData);
        debugPrint(
            'the name is ${verifiedBankNumberModel01.data!.details!.accountName}');
        verifiedBankNumberModel.value = verifiedBankNumberModel01;
        update();

        // ref.read(verifiedBankNumberModelProvider.notifier).state =
        //     transactionDetails;
        // navigateToNextPage();
      } else {
        final responseData = convert.jsonDecode(response.body);
        // showErrorMessage('${responseData['message']}');
        print('${responseData['message']}');

        _isSuccessAndLoadingContainerShowing = false;
        _isFailuresContainerShowing = true;
        _isButtonEnabled = true;
        update();
        return;
      }
    } catch (e) {
      _isSuccessAndLoadingContainerShowing = false;
      _isFailuresContainerShowing = true;
      _isButtonEnabled = true;

      update();

      return;
    } finally {
      // Reset loading state
      _isLoading = false;
      update();
    }
  }

  Future<void> getAllBanks() async {
    final url = Uri.parse(
        'https://egofinance-egofinance-be.pidagt.easypanel.host/transfers/banks');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${box.read('BearerToken')}',
    };

    try {
      _isGetBankListLoading = true;
      update();

      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body) as Map<String, dynamic>;
        final bankList = BankListModel.fromJson(responseData);

        // Populate _listOfBanks and _filteredBanks with the fetched data
        _listOfBanks = bankList.data!.map((bank) => bank.toJson()).toList();
        _filteredBanks = _listOfBanks; // Initially, show all banks

        update();
      }
    } catch (e) {
      print('Error fetching banks: $e');
    } finally {
      _isGetBankListLoading = false;
      update();
    }
  }
}

// Functions and Setters....................

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../controllers/transfer/transfer_controller.dart';
import '../../../controllers/transfer/transfer_to_other_bank_provider.dart';
import '../../../utils/constants/data_constant.dart';
import '../../../utils/constants/nav_ids.dart';
import 'transfer_to_egoFinace_screen_receipt.dart';
import 'transfer_to_otherBank_screen_receipt.dart';
import '../verify_identity_screen.dart';

// import 'package:overlay_support/overlay_support.dart';

class TransferToOtherBankPinScreen extends StatefulWidget {
  final String recipientName;
  final String recipientAccountNumber;
  final String recipientCode;
  final String recipientBank;
  final String walletId;
  final String amount;
  final String reason;

  const TransferToOtherBankPinScreen({
    super.key,
    required this.recipientAccountNumber,
    required this.recipientName,
    required this.recipientCode,
    required this.recipientBank,
    required this.walletId,
    required this.amount,
    required this.reason,
  });

  @override
  State<TransferToOtherBankPinScreen> createState() =>
      _TransferToOtherBankPinScreenState();
}

class _TransferToOtherBankPinScreenState
    extends State<TransferToOtherBankPinScreen> {
  final _firstPinController = TextEditingController();

  final _secondPinController = TextEditingController();

  final _thirdPinController = TextEditingController();

  final _fourthPinController = TextEditingController();

  @override
  void dispose() {
    _firstPinController.dispose();
    _secondPinController.dispose();
    _thirdPinController.dispose();

    _fourthPinController.dispose();
    super.dispose();
  }

  void _showBottomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final screenSize = MediaQuery.of(context).size;
        return Align(
          alignment: Alignment.bottomCenter, // Align at the bottom
          child: Padding(
            padding: const EdgeInsets.all(0.0), // Optional padding
            child: Material(
              color: Colors.transparent, // Make the background transparent
              child: Container(
                margin:
                    EdgeInsets.fromLTRB(10, 0, 10, screenSize.height * 0.02),
                width: MediaQuery.of(context).size.width, // Full width
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize:
                      MainAxisSize.min, // Take up minimum vertical space
                  children: [
                    w700_16(context, 'Biometric authentication required',
                        blackColor),
                    SizedBox(height: screenSize.height * 0.01),
                    w400_14_02(
                      context,
                      'Verify Identity',
                      Color.fromRGBO(143, 154, 160, 1),
                    ),
                    SizedBox(height: screenSize.height * 0.02),
                    GestureDetector(
                      onTap: () {
                        _handleOtp();
                        // context.go('/transferReceipt');
                        // Navigator.of(context).push(
                        //   PageTransition(
                        //       child: TransferToEgoFinaceSuccessScreen(),
                        //       type: PageTransitionType.leftToRight
                        //       // duration: Duration(seconds: 1),

                        //       ),
                        // );
                      },
                      child: Container(
                        // color: secondaryColor,
                        height: screenSize.height * 0.06,
                        width: screenSize.width * 0.2,
                        child: svgAsset(
                          'lib/assets/fingerdebugPrint.svg',
                        ),
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.01),
                    w400_14_02(
                      context,
                      'Scan FingerdebugPrint to authenticate',
                      Color.fromRGBO(143, 154, 160, 1),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: w400_14(
                        context,
                        'Cancel',
                        blackColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void openBottomSheet() {
    showModalBottomSheet(
      //  enableDrag: false,
      isDismissible: false,
      // isScrollControlled: true,
      backgroundColor: whiteColor,
      context: context,
      builder: (context) {
        final screenSize = MediaQuery.of(context).size;
        return Container(
          margin: EdgeInsets.all(30),
          // height: screenSize.height * 0.35,
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(
              //   height: 100,
              //   width: 100,
              //   child: Image.asset(
              //     'lib/assets/success01.png',
              //     // fit: BoxFit.contain,
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child:
                    w700_24(context, 'Enter your transaction pin', blackColor),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: w400_14(
              //     context,
              //     'Your phone number has been verified',
              //     textColorSecondary,
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }

  bool _isTimingComplete = false;
  bool _isLoading = false;
  Future _simulateNetworkRequest() async {
    try {
      setState(() {
        _isLoading = true;
      });

      await Future.delayed(Duration(seconds: 3));
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        _isLoading = false;
        openBottomSheet();
      });
    }
  }

  // final ScaffoldMessengerState _scaffold = NavigatorKey.scaffoldKey;

  void showNotificatiion() {}

  @override
  void initState() {
    // TODO: implement initState
    showNotificatiion();

    super.initState();
  }

  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
  void onEnd() {
    debugPrint('onEnd');
  }

  bool hasInternet = false;

  Future<void> _handleOtp() async {
    final TransferToOtherBankController transferToOtherBankController =
        Get.find<TransferToOtherBankController>();

    var accountDetails =
        transferToOtherBankController.verifiedBankNumberModel.value;
    // var accountDetails = ref.watch(verifiedBankNumberModelProvider);

    // var firstPin = _firstPinController.text;
    // var secondPin = _secondPinController.text;
    // var thirdPin = _thirdPinController.text;
    // var fouthPin = _fourthPinController.text;

    if (_firstPinController.text.trim().isEmpty ||
        _secondPinController.text.trim().isEmpty ||
        _thirdPinController.text.trim().isEmpty ||
        _fourthPinController.text.trim().isEmpty) {
      // Show error if any field is empty
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: secondaryColor,
          behavior: SnackBarBehavior.floating,
          content:
              Center(child: Text("Incomplete PIN, please enter all digits")),
        ),
      );
      return;
    } else {
      var firstPin = int.parse(_firstPinController.text.trim());
      var secondPin = int.parse(_secondPinController.text.trim());
      var thirdPin = int.parse(_thirdPinController.text.trim());
      var fourthPin = int.parse(_fourthPinController.text.trim());
      debugPrint('first pin type ${firstPin.runtimeType}');
      debugPrint('second pin type ${secondPin.runtimeType}');
      debugPrint('third pin type ${thirdPin.runtimeType}');
      debugPrint('fourth pin type ${fourthPin.runtimeType}');

      String combineTextFields() {
        return "${firstPin}${secondPin}${thirdPin}${fourthPin}";
      }

      String combinedText = combineTextFields().trim();

      debugPrint('the id  ${widget.walletId}');
      debugPrint(
          'the recipientAccountNumber sfsff ${widget.recipientAccountNumber}');
      debugPrint('the code sfsff ${accountDetails!.data!.recipientCode}');
      debugPrint('the recipientName sfsff ${widget.recipientName}');
      debugPrint('the recipientBank sfsff ${widget.recipientBank}');
      debugPrint('the reason sfsff ${widget.reason}');
      debugPrint('the amount sfsff ${widget.amount}');
      debugPrint('the combined text sfsff ${combinedText}');
      debugPrint('the combined text type is ${combinedText.runtimeType}');
      debugPrint(
          'the combined text type is ${int.parse(combinedText).runtimeType}');

      await transferToOtherBankController.simulateTransferToOtherBank(
          int.parse(widget.amount), // 02 amount
          '${widget.recipientAccountNumber}', // 03
          '${accountDetails!.data!.recipientCode}', // 04
          '${widget.recipientName}', // 05
          '${widget.recipientBank}', // 06
          '${widget.walletId}', // 07
          '${widget.reason}', // 08
          combinedText, // 09
          (message) async {
        showTopSnackBar(
          snackBarPosition: SnackBarPosition.top, // 10
          Overlay.of(context),
          CustomSnackBar.success(
            message: message,
          ),
        );
      }, (message) async {
        showTopSnackBar(
          snackBarPosition: SnackBarPosition.top, // 11
          Overlay.of(context),
          CustomSnackBar.error(
            message: message,
          ),
        );
      }, () => Get.to(TransferToOtherBankScreenReceipt()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final TransferToOtherBankController transferToOtherBankController =
        Get.find<TransferToOtherBankController>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: _isLoading
            ? null
            : AppBar(
                backgroundColor: whiteColor,
              ),
        backgroundColor: whiteColor,
        body: transferToOtherBankController.isLoading
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Lottie.asset('lib/assets/rPUhRrTlFG.json'),
                    ),
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: w700_20(
                          context, 'Enter your transaction pin', blackColor),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(
                    //     top: 10.0,
                    //     left: 20,
                    //     right: 10,
                    //   ),
                    //   child: w400_14(
                    //     context,
                    //     'We sent a code to your email. Enter the code to',
                    //     textColorSecondary,
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(
                    //     bottom: 20.0,
                    //     left: 20,
                    //     right: 10,
                    //   ),
                    //   child: w400_14(
                    //       context, 'verify your email', textColorSecondary),
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    content(),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          w400_12(context, "Forgot Pin? ", blackColor),
                          w400_12(context, "Resent ", secondaryColor),
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        _handleOtp();
                        // openBottomSheet();
                        // Navigator.of(context).push(
                        //   PageTransition(
                        //       child: VerifyIdentityScreen(),
                        //       type: PageTransitionType.leftToRight
                        //       duration: Duration(seconds: 1)),
                        // );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: screenSize.height * 0.2,
                          left: 20,
                          right: 20,
                          bottom: screenSize.height * 0.02,
                        ),
                        child: Container(
                          height: screenSize.height * 0.06,
                          width: screenSize.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: secondaryColor),
                          child: Center(
                              child: w500_17(context, 'Verify', whiteColor)),
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.bottomCenter, // Align at the bottom
                      child: Padding(
                        padding: const EdgeInsets.all(0.0), // Optional padding
                        child: Material(
                          color: Colors
                              .transparent, // Make the background transparent
                          child: Container(
                            margin: EdgeInsets.fromLTRB(
                                10, 0, 10, screenSize.height * 0.02),
                            width:
                                MediaQuery.of(context).size.width, // Full width
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(20), // Rounded corners
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: Offset(0, -5),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize
                                  .min, // Take up minimum vertical space
                              children: [
                                w700_16(
                                    context,
                                    'Biometric authentication required',
                                    blackColor),
                                SizedBox(height: screenSize.height * 0.01),
                                w400_14_02(
                                  context,
                                  'Verify Identity',
                                  Color.fromRGBO(143, 154, 160, 1),
                                ),
                                SizedBox(height: screenSize.height * 0.02),
                                GestureDetector(
                                  onTap: () {
                                    _handleOtp();
                                    // context.go('/transferReceipt');
                                    // Navigator.of(context).push(
                                    //   PageTransition(
                                    //       child: TransferToEgoFinaceSuccessScreen(),
                                    //       type: PageTransitionType.leftToRight
                                    //       // duration: Duration(seconds: 1),

                                    //       ),
                                    // );
                                  },
                                  child: Container(
                                    // color: secondaryColor,
                                    height: screenSize.height * 0.06,
                                    width: screenSize.width * 0.2,
                                    child: svgAsset(
                                      'lib/assets/fingerdebugPrint.svg',
                                    ),
                                  ),
                                ),
                                SizedBox(height: screenSize.height * 0.01),
                                w400_14_02(
                                  context,
                                  'Scan FingerdebugPrint to authenticate',
                                  Color.fromRGBO(143, 154, 160, 1),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Close the dialog
                                  },
                                  child: w400_14(
                                    context,
                                    'Cancel',
                                    blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }

  Widget content() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15,
        bottom: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // First TextFormField
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              height: 60,
              child: TextFormField(
                controller: _firstPinController,
                obscureText: true,
                cursorColor: secondaryColor,
                onChanged: (value) {
                  if (value.length == 1 &&
                      _firstPinController.text.isNotEmpty) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: textFieldBorderColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  filled: true,
                  fillColor: textfieldColor,
                  focusColor: textfieldColor,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: textFieldBorderColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: textFieldBorderColor),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                style: GoogleFonts.quicksand(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
          ),

          // Second TextFormField
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              height: 60,
              child: TextFormField(
                controller: _secondPinController,
                cursorColor: secondaryColor,
                obscureText: true,
                onChanged: (value) {
                  if (value.length == 1 &&
                      _secondPinController.text.isNotEmpty) {
                    FocusScope.of(context).nextFocus();
                  } else if (value.length == 0) {
                    FocusScope.of(context).previousFocus();
                  }
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: textFieldBorderColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  filled: true,
                  fillColor: textfieldColor,
                  focusColor: textfieldColor,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: textFieldBorderColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: GoogleFonts.quicksand(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
          ),

          // Third TextFormField
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              height: 60,
              child: TextFormField(
                controller: _thirdPinController,
                cursorColor: secondaryColor,
                obscureText: true,
                onChanged: (value) {
                  if (value.length == 1 &&
                      _thirdPinController.text.isNotEmpty) {
                    FocusScope.of(context).nextFocus();
                  } else if (value.length == 0) {
                    FocusScope.of(context).previousFocus();
                  }
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: textFieldBorderColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  filled: true,
                  fillColor: textfieldColor,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: textFieldBorderColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: textFieldBorderColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: GoogleFonts.quicksand(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
          ),

          // Fourth TextFormField
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              height: 60,
              child: TextFormField(
                controller: _fourthPinController,
                cursorColor: secondaryColor,
                obscureText: true,
                onChanged: (value) {
                  if (value.length == 1 &&
                      _fourthPinController.text.isNotEmpty) {
                    FocusScope.of(context).nextFocus();
                  } else if (value.length == 0) {
                    FocusScope.of(context).previousFocus();
                  }
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: textFieldBorderColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  filled: true,
                  fillColor: textfieldColor,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: textFieldBorderColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: textFieldBorderColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: GoogleFonts.quicksand(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

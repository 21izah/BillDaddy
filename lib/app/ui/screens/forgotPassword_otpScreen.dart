import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../controllers/auth/forgotten_password_controller.dart';
import '../../utils/constants/data_constant.dart';

class ForgotpasswordOtpscreen extends StatefulWidget {
  final String email;
  const ForgotpasswordOtpscreen({Key? key, required this.email});

  @override
  State<ForgotpasswordOtpscreen> createState() =>
      _ForgotpasswordOtpscreenState();
}

class _ForgotpasswordOtpscreenState extends State<ForgotpasswordOtpscreen> {
  final _firstPinController = TextEditingController();

  final _secondPinController = TextEditingController();

  final _thirdPinController = TextEditingController();

  final _fourthPinController = TextEditingController();
  final _fifthPinController = TextEditingController();

  final _sixthPinController = TextEditingController();
  @override
  void dispose() {
    _firstPinController.dispose();
    _secondPinController.dispose();
    _thirdPinController.dispose();
    _fourthPinController.dispose();
    _fifthPinController.dispose();
    _sixthPinController.dispose();
    super.dispose();
  }

  void showNotificatiion() {}
  @override
  void initState() {
    // TODO: implement initState
    showNotificatiion();

    super.initState();
  }

  int endTime = DateTime.now().millisecondsSinceEpoch +
      10000; // 600,000 milliseconds = 10 minutes
  // int endTime = DateTime.now().millisecondsSinceEpoch +
  //     600000; // 600,000 milliseconds = 10 minutes
  void onEnd() {
    print('onEnd');
  }

  Future<void> _handleOtp() async {
    final box = GetStorage();
    // final _username = Hive.box('settingsBox');

    /// 01 check input
    /// 02 check internet connectivity
    /// 03 check api

    final ForgottenPasswordController forgottenPasswordController =
        Get.put(ForgottenPasswordController());
    String combineTextFields() {
      return '${_firstPinController.text}${_secondPinController.text}${_thirdPinController.text}${_fourthPinController.text}${_fifthPinController.text}${_sixthPinController.text}';
    }

    String combinedText = combineTextFields();
    // print('my email ${_username.get('forgotPasswordemail')}');
    print('my email ${widget.email}');
    await forgottenPasswordController.simulateForgetPasswordOtp(
        // _username.get('forgotPasswordemail'),
        '${widget.email}',
        combinedText,
        (message) => showTopSnackBar(
              snackBarPosition: SnackBarPosition.top,
              Overlay.of(context),
              CustomSnackBar.success(
                message: message,
              ),
            ),
        (message) => showTopSnackBar(
              snackBarPosition: SnackBarPosition.top,
              Overlay.of(context),
              CustomSnackBar.error(
                message: message,
              ),
            ), () {
      Navigator.of(context).push(
        PageTransition(
            child: ForgotpasswordOtpscreen(
              email: widget.email,
            ),
            type: PageTransitionType.leftToRight
            // duration: Duration(seconds: 1),
            ),
      );
      box.write('forgotPasswordemail', '');
      print('my email ${box.read('forgotPasswordemail')}');
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final ForgottenPasswordController forgottenPasswordController =
        Get.put(ForgottenPasswordController());

    return Scaffold(
      backgroundColor: background02,
      appBar: forgottenPasswordController.isLoading
          ? null
          : AppBar(
              backgroundColor: Colors.transparent,
              leadingWidth: 150,
              leading: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: GestureDetector(
                  onTap: () => Get.toNamed('/loginScreen'),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back_ios, color: blackColor),
                    ],
                  ),
                ),
              ),
            ),
      resizeToAvoidBottomInset: false,
      body: forgottenPasswordController.isLoading
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
                    padding: const EdgeInsets.only(left: 20.0, bottom: 11),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        w600_20(context, 'Enter Verification Code', blackColor),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          // This ensures the text wraps properly
                          child: RichText(
                            textAlign:
                                TextAlign.start, // Center-aligns the text
                            text: TextSpan(
                              style: w500_14_s(context, blackColor),
                              children: [
                                TextSpan(
                                  text:
                                      'We sent a code to your email. Enter the code to verify your phone',
                                  style: w500_14_s(
                                    context,
                                    Color.fromRGBO(51, 51, 51, 0.71),
                                  ),
                                ),
                                // TextSpan(
                                //   text: ' 907****400',
                                //   style: w500_14_s(
                                //     context,
                                //     Color.fromRGBO(51, 51, 51, 0.71),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  content(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 34),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Row(
                        //   children: [
                        //     w400_12(
                        //         context, "Didn't receive code? ", blackColor),
                        //   ],
                        // ),
                        // Row(
                        //   children: [
                        //     w400_12(context, 'Resend', secondaryColor),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 20.0),
                  //   child: RichText(
                  //     textAlign: TextAlign.center, // Center-aligns the text
                  //     text: TextSpan(
                  //       style: w400_12_s(context, blackColor),
                  //       children: [
                  //         TextSpan(
                  //           text: 'Resend code in ',
                  //           style: w400_12_s(
                  //             context,
                  //             blackColor,
                  //           ),
                  //         ),
                  //         TextSpan(
                  //           text: ' 907****400',
                  //           style: w400_12_s(
                  //             context,
                  //             secondaryColor,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 20,
                      top: screenSize.height * 0.02,
                    ),
                    child: Row(
                      children: [
                        // w400_12(context, "Resend code in ", blackColor),
                        CountdownTimer(
                          onEnd: onEnd,
                          endTime: endTime,
                          widgetBuilder: (_, CurrentRemainingTime? time) {
                            if (time == null) {
                              return Row(
                                children: [
                                  w400_12(context, "Didn't receive code? ",
                                      blackColor),
                                  GestureDetector(
                                      onTap: () {},
                                      child: w400_12(
                                          context, "Resend", secondaryColor)),
                                ],
                              );
                            }
                            final minutes = time.min ?? 0;
                            final seconds = time.sec ?? 0;
                            final formattedTime =
                                '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
                            return Row(
                              children: [
                                Text(
                                  'Resend code in ',
                                  style: buttonText04Style(blackColor),
                                ),
                                Text(
                                  '${formattedTime}',
                                  style: buttonText04Style(secondaryColor),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: _handleOtp,
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
                ],
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

          // Fifth TextFormField
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              height: 60,
              child: TextFormField(
                controller: _fifthPinController,
                cursorColor: secondaryColor,
                onChanged: (value) {
                  if (value.length == 1 &&
                      _fifthPinController.text.isNotEmpty) {
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

          // Sixth TextFormField
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              height: 60,
              child: TextFormField(
                controller: _sixthPinController,
                cursorColor: secondaryColor,
                onChanged: (value) {
                  if (value.length == 1 &&
                      _sixthPinController.text.isNotEmpty) {
                    FocusScope.of(context).unfocus();
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

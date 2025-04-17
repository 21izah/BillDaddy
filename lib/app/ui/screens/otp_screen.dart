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

import '../../controllers/auth/sign_up_otp_controller.dart';
import '../../utils/constants/data_constant.dart';
import 'verify_identity_screen.dart';

// import 'package:overlay_support/overlay_support.dart';
// import 'package:hive_flutter/hive_flutter.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
              SizedBox(
                height: 100,
                width: 100,
                child: Image.asset(
                  'lib/assets/success01.png',
                  // fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: w700_24(context, 'Verification Successful', blackColor),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: w400_14(
                  context,
                  'Your phone number has been verified',
                  textColorSecondary,
                ),
              ),
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
    print('onEnd');
  }

  bool hasInternet = false;

  Future<void> _handleOtp() async {
    final box = GetStorage();
    // final _username = Hive.box('settingsBox');

    /// 01 check input
    /// 02 check internet connectivity
    /// 03 check api

    // final registrationOtpAuth = ref.watch(registrationOtpProvider);
    final RegistrationOtpController registrationOtpController =
        Get.put(RegistrationOtpController());

    String combineTextFields() {
      return '${_firstPinController.text}${_secondPinController.text}${_thirdPinController.text}${_fourthPinController.text}';
    }

    String combinedText = combineTextFields();

    await registrationOtpController.simulateOtpVerification(
      box.read('email'),
      // _username.get('email'),
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
      ),
      () => // openBottomSheet();
          Navigator.of(context).push(
        PageTransition(
            child: VerifyIdentityScreen(), type: PageTransitionType.leftToRight
            // duration: Duration(seconds: 1),
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final RegistrationOtpController registrationOtpController =
        Get.put(RegistrationOtpController());

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: _isLoading ? null : AppBar(),
        backgroundColor: background02,
        body: registrationOtpController.isLoading
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
                      child: w700_24(
                          context, 'Enter Verification Code', blackColor),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        left: 20,
                        right: 10,
                      ),
                      child: w400_14(
                        context,
                        'We sent a code to your email. Enter the code to',
                        textColorSecondary,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 20.0,
                        left: 20,
                        right: 10,
                      ),
                      child: w400_14(
                          context, 'verify your email', textColorSecondary),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    content(),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          w400_12(context, "Didn’t get the code? ", blackColor),
                          w400_12(context, "Resend ", secondaryColor),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 20,
                        top: screenSize.height * 0.02,
                      ),
                      child: Row(
                        children: [
                          w400_12(context, "Resend code in ", blackColor),
                          CountdownTimer(
                            onEnd: onEnd,
                            endTime: endTime,
                            widgetBuilder: (_, CurrentRemainingTime? time) {
                              if (time == null) {
                                return w400_12(
                                    context, "Code Expired ", secondaryColor);
                              }
                              final minutes = time.min ?? 0;
                              final seconds = time.sec ?? 0;
                              final formattedTime =
                                  '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
                              return Text(
                                formattedTime,
                                style: buttonText04Style(secondaryColor),
                              );
                            },
                          ),
                          // CountdownTimer(
                          //   endWidget: Center(
                          //     child:  w400_12(
                          // context,"Code Expired ", secondaryColor),
                          //   ),
                          //   endTime: endTime,
                          //   onEnd: onEnd,
                          //   textStyle: buttonText04Style(secondaryColor),
                          // ),
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
                              child:
                                  w500_17(context, 'Verify Code', whiteColor)),
                        ),
                      ),
                    ),
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
        ],
      ),
    );
  }
}

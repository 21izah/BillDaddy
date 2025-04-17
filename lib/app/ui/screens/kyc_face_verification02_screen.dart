import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:async';

import '../../utils/constants/data_constant.dart';
import 'kyc_face_verification_screen.dart';
import 'kyc_successful_screen.dart';

class KycFaceVerification02Screen extends StatefulWidget {
  const KycFaceVerification02Screen({super.key});

  @override
  State<KycFaceVerification02Screen> createState() =>
      _KycFaceVerification02ScreenState();
}

class _KycFaceVerification02ScreenState
    extends State<KycFaceVerification02Screen> {
  bool isVisible = true;
  bool isProcessing = true;
  bool isBlurring = false;
  double progress = 0.0;
  // bool isVisible = true;
  // bool isProcessing = true;
  // double progress = 0.0; //

  void startLoadingAndNavigate() {
    // Show blur and loader for 3 seconds, then navigate
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isBlurring = false;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                KycSuccessfulScreen()), // Replace with your next screen
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _openBottomSheet();
  }

  _openBottomSheet() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    showModalBottomSheet(
      //  enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      backgroundColor: whiteColor,
      context: context,
      builder: (context) {
        final screenSize = MediaQuery.of(context).size;

        return StatefulBuilder(
          builder: (context, bottomSheetSetState) {
            Timer? _timer;

            // Function to start progress and update the indicator
            void startProgress() {
              _timer =
                  Timer.periodic(const Duration(milliseconds: 100), (timer) {
                bottomSheetSetState(() {
                  progress += 0.1;
                  if (progress >= 1.0) {
                    progress = 1.0;
                    timer.cancel();
                    isProcessing = false;
                  }
                });
              });
            }

            return Container(
              margin: EdgeInsets.fromLTRB(
                  40, screenSize.height * 0.04, 40, screenSize.height * 0.04),
              // height: screenSize.height * 0.5,
              width: double.infinity,
              child: Visibility(
                visible: isVisible,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromRGBO(218, 218, 218, 1))),
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                        'lib/assets/kyc_face02.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: w400_14(
                        context,
                        'Make sure your face is visible',
                        Color.fromRGBO(143, 154, 160, 1),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        bottomSheetSetState(() {
                          isVisible = false;
                        });
                        startProgress(); // Start progress animation here
                      },
                      child: Container(
                        height: screenSize.height * 0.06,
                        width: screenSize.width,
                        margin: EdgeInsets.only(top: screenSize.height * 0.035),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: secondaryColor,
                        ),
                        child: Center(
                          child: w500_17(context, 'Continue', whiteColor),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const KycFaceVerificationScreen()),
                        );
                      },
                      child: Container(
                        height: screenSize.height * 0.06,
                        width: screenSize.width,
                        margin: EdgeInsets.only(top: screenSize.height * 0.015),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromRGBO(51, 51, 51, 0.5)),
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                        ),
                        child: Center(
                          child: w500_17(context, 'Retake Selfie', blackColor),
                        ),
                      ),
                    ),
                  ],
                ),
                replacement: Visibility(
                  visible: isProcessing,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: screenSize.height * 0.02),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(218, 218, 218, 1))),
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          'lib/assets/kyc_selfie.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: screenSize.height * 0.02),
                        child: w600_24(
                          context,
                          'Processing Selfie',
                          Color.fromRGBO(51, 51, 51, 1),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 8.0, bottom: screenSize.height * 0.1),
                        child: w400_14(
                          context,
                          'Wait for a few seconds...',
                          Color.fromRGBO(51, 51, 51, 1),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LinearPercentIndicator(
                            barRadius: const Radius.circular(20),
                            animation: false,
                            animationDuration: 1000,
                            progressColor: secondaryColor,
                            width: screenSize.width * 0.7,
                            lineHeight: 5.0,
                            percent: progress,
                            backgroundColor: textfieldColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                  replacement: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: screenSize.height * 0.02),
                        height: 150,
                        width: 150,
                        child: Lottie.asset('lib/assets/checkAnimation.json'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: screenSize.height * 0.02),
                        child: w600_18(
                          context,
                          'Selfie Successfully Uploaded',
                          Color.fromRGBO(51, 51, 51, 1),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context); // Close BottomSheet
                          setState(() {
                            isBlurring = true; // Show blur and loader
                          });
                          startLoadingAndNavigate();
                        },
                        child: Container(
                          height: screenSize.height * 0.06,
                          width: screenSize.width,
                          margin:
                              EdgeInsets.only(top: screenSize.height * 0.15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: secondaryColor,
                          ),
                          child: Center(
                            child: w500_17(context, 'Continue', whiteColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: [
                  Transform.scale(
                    scale: 0.7,
                    child: Image.asset(
                      'lib/assets/kyc_face01.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Neutral',
                    style: TextStyle(color: Color.fromRGBO(143, 154, 160, 1)),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (isBlurring)
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: Lottie.asset('lib/assets/rPUhRrTlFG.json'),
              ),
            ),
          ),
      ],
    );
  }
}

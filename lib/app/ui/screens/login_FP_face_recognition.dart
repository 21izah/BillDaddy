import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/data_constant.dart';

class LoginFpFaceRecognition extends StatefulWidget {
  const LoginFpFaceRecognition({super.key});

  @override
  State<LoginFpFaceRecognition> createState() => _LoginFpFaceRecognitionState();
}

class _LoginFpFaceRecognitionState extends State<LoginFpFaceRecognition> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: background02,
        appBar: AppBar(
          leadingWidth: screenSize.width,
          leading: Padding(
            padding: EdgeInsets.only(
              left: screenSize.width * 0.05,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      void _showBottomDialog(BuildContext context) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: Align(
                                alignment:
                                    Alignment.topCenter, // Align at the bottom
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                      20.0), // Optional padding
                                  child: Material(
                                    color: Colors
                                        .transparent, // Make the background transparent
                                    child: Container(
                                      // height: screenSize.height * 0.3,
                                      width: MediaQuery.of(context)
                                          .size
                                          .width, // Full width
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                            20), // Rounded corners
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            blurRadius: 10,
                                            offset: Offset(0, -5),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize
                                            .min, // Take up minimum vertical space
                                        children: [
                                          w600_15(
                                              context,
                                              'Are you sure you want to exit?',
                                              blackColor),
                                          SizedBox(height: 10),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context)
                                                        .pop(); // Close the dialog
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    margin: EdgeInsets.only(
                                                        left: 10),
                                                    height: 40,
                                                    width:
                                                        screenSize.width * 0.3,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color:
                                                              secondaryColor),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: w500_14(context,
                                                        'No', secondaryColor),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.toNamed(
                                                        '/loginVerifyPhoneNumber');
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height: 40,
                                                    width:
                                                        screenSize.width * 0.3,
                                                    decoration: BoxDecoration(
                                                      color: secondaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: w500_14(context,
                                                        'Yes', whiteColor),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }

                      _showBottomDialog(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: w600_17(
                      context,
                      'EgoFinance Face recognition',
                      blackColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: whiteColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset('lib/assets/Facial_Recognition.png'),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0.0, top: 30, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    w600_20(context, 'EgoFinance Face recognition', blackColor),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    w400_16(
                      context,
                      'Face recognition verification to ensure',
                      Color.fromRGBO(
                        51,
                        51,
                        51,
                        0.2,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        w400_16(
                          context,
                          'account security.',
                          Color.fromRGBO(
                            51,
                            51,
                            51,
                            0.2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/loginFpConfirmation');
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    top: screenSize.height * 0.15,
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
                    child:
                        Center(child: w500_17(context, 'Verify', whiteColor)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

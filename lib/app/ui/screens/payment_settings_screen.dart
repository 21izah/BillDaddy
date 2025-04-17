import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/data_constant.dart';

class PaymentSettingsScreen extends StatefulWidget {
  const PaymentSettingsScreen({super.key});

  @override
  State<PaymentSettingsScreen> createState() => _PaymentSettingsScreenState();
}

class _PaymentSettingsScreenState extends State<PaymentSettingsScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background02,
      appBar: AppBar(
        backgroundColor: whiteColor,
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
                    Get.offAllNamed('/me/settings');
                    // Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: w600_17(context, 'Payment Settings', blackColor),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 8),
              child: Row(
                children: [
                  w600_20(context, 'Payment PIN', blackColor),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x40C4C4C4), // #C4C4C440 with 25% opacity
                    offset: Offset(0, 4), // 0px on x-axis, 4px on y-axis
                    blurRadius: 8, // 8px blur radius
                    spreadRadius: 0, // 0px spread radius (optional)
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/verifyPaymentPin');
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(),
                                      child: w600_17(context,
                                          'Change Payment PIN', blackColor),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 22,
                            width: 22,
                            child: svgAsset(
                              'lib/assets/vright_arrow.svg',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/forgotPasswordPaymentVerifyNumber');
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(),
                                      child: w600_17(context,
                                          'Forgot Payment PIN', blackColor),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 22,
                            width: 22,
                            child: svgAsset(
                              'lib/assets/vright_arrow.svg',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 30, bottom: 10),
              child: Row(
                children: [
                  w600_20(context, 'Biometric Payment', blackColor),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x40C4C4C4), // #C4C4C440 with 25% opacity
                    offset: Offset(0, 4), // 0px on x-axis, 4px on y-axis
                    blurRadius: 8, // 8px blur radius
                    spreadRadius: 0, // 0px spread radius (optional)
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(
                      //   PageTransition(
                      //     child: Bottomnavigation(
                      //       initialIndex: 4, // Main index
                      //       initialSubIndex:
                      //           2, // Sub-index for MeScreen (SettingsScreen)
                      //     ),
                      //     type: PageTransitionType.leftToRight
                      //     duration: Duration(seconds: 1),
                      //   ),
                      // );
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(),
                                      child: w600_17(context,
                                          'Pay with Fingerprint', blackColor),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Container(
                              height: 24,
                              width: 24,
                              child: Transform.scale(
                                scale:
                                    0.7, // Adjust the scale factor to control the size
                                child: SizedBox(
                                  child: Switch.adaptive(
                                    activeColor: secondaryColor,
                                    value: isChecked,
                                    onChanged: (value) =>
                                        setState(() => isChecked = value),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

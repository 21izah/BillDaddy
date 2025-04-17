import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/data_constant.dart';

class UssdScreen extends StatefulWidget {
  const UssdScreen({super.key});

  @override
  State<UssdScreen> createState() => _UssdScreenState();
}

class _UssdScreenState extends State<UssdScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background02,

      appBar: AppBar(
        backgroundColor: whiteColor,
        leadingWidth: screenSize.width * 0.9,
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
                    Get.offAllNamed('/me');
                    // Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: w600_14_02(context,
                      'Quick Payments with EgoFinance USSD', blackColor),
                ),
              ],
            ),
          ),
        ),
      ),

      // AppBar(
      //   centerTitle: false,
      //   title: w400_20(
      //     context,
      //     'Quick Payments with EgoFinance USSD',
      //     blackColor,
      //   ),
      //   backgroundColor: whiteColor,
      // ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20, bottom: screenSize.height * 0.02),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: whiteColor),
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.08), // Set the shadow color
                                    offset: Offset(
                                        0, 4), // Horizontal and vertical offset
                                    blurRadius:
                                        4, // How much the shadow should be blurred
                                  ),
                                ],
                                color: Color.fromRGBO(220, 229, 239, 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: svgAsset(
                                'lib/assets/tfussd.svg',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(),
                                    child: w500_17(context,
                                        'Transfer to Bank Account', blackColor),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(),
                                    child: w400_11_soft_wrap(
                                        '*823*3*amount*10 digit number no. #',
                                        blackColor),
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
                            'lib/assets/tf_call.svg',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   PageTransition(
                    //     child: Bottomnavigation(
                    //       initialIndex: 4, // Main index
                    //       initialSubIndex:
                    //           35, // Sub-index for MeScreen (SettingsScreen)
                    //     ),
                    //     type: PageTransitionType.leftToRight
                    //     duration: Duration(seconds: 1),
                    //   ),
                    // );
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          // Ensures text wraps properly
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Align text correctly
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.08),
                                      offset: Offset(0, 4),
                                      blurRadius: 4,
                                    ),
                                  ],
                                  color: Color.fromRGBO(220, 229, 239, 1),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: svgAsset('lib/assets/tfussd.svg'),
                              ),
                              SizedBox(width: 10), // Add spacing
                              Expanded(
                                // Wrap the text properly
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    w500_17_soft_wrap(
                                        context,
                                        'Transfer to EgoFinance Account',
                                        blackColor),
                                    w400_11_soft_wrap(
                                        '*823*3*amount*10 digit number no. #',
                                        blackColor),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 22,
                          width: 22,
                          child: svgAsset('lib/assets/tf_call.svg'),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(color: textFieldBorderColor),
                //dsdsdsd
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   PageTransition(
                    //     child: Bottomnavigation(
                    //       initialIndex: 4, // Main index
                    //       initialSubIndex:
                    //           35, // Sub-index for MeScreen (SettingsScreen)
                    //     ),
                    //     type: PageTransitionType.leftToRight
                    //     duration: Duration(seconds: 1),
                    //   ),
                    // );
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.08), // Set the shadow color
                                    offset: Offset(
                                        0, 4), // Horizontal and vertical offset
                                    blurRadius:
                                        4, // How much the shadow should be blurred
                                  ),
                                ],
                                color: Color.fromRGBO(220, 229, 239, 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: svgAsset(
                                'lib/assets/tf_airtime.svg',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(),
                                    child: w500_17(context, 'Airtime for self',
                                        blackColor),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(),
                                    child: w400_11_soft_wrap(
                                        '*823*3*amount#', blackColor),
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
                            'lib/assets/tf_call.svg',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   PageTransition(
                    //     child: Bottomnavigation(
                    //       initialIndex: 4, // Main index
                    //       initialSubIndex:
                    //           35, // Sub-index for MeScreen (SettingsScreen)
                    //     ),
                    //     type: PageTransitionType.leftToRight
                    //     duration: Duration(seconds: 1),
                    //   ),
                    // );
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.08), // Set the shadow color
                                    offset: Offset(
                                        0, 4), // Horizontal and vertical offset
                                    blurRadius:
                                        4, // How much the shadow should be blurred
                                  ),
                                ],
                                color: Color.fromRGBO(220, 229, 239, 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: svgAsset(
                                'lib/assets/tf_airtime.svg',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(),
                                    child: w500_17(context,
                                        'Airtime for Others', blackColor),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(),
                                    child: w400_11_soft_wrap(
                                        '*823*3*amount*mobile no.#',
                                        blackColor),
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
                            'lib/assets/tf_call.svg',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(color: textFieldBorderColor),
                //dsdsdsd
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   PageTransition(
                    //     child: Bottomnavigation(
                    //       initialIndex: 4, // Main index
                    //       initialSubIndex:
                    //           35, // Sub-index for MeScreen (SettingsScreen)
                    //     ),
                    //     type: PageTransitionType.leftToRight
                    //     duration: Duration(seconds: 1),
                    //   ),
                    // );
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.08), // Set the shadow color
                                    offset: Offset(
                                        0, 4), // Horizontal and vertical offset
                                    blurRadius:
                                        4, // How much the shadow should be blurred
                                  ),
                                ],
                                color: Color.fromRGBO(220, 229, 239, 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: svgAsset(
                                'lib/assets/tf_airtime.svg',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(),
                                    child: w500_17(context, 'Data', blackColor),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(),
                                    child: w400_11_soft_wrap(
                                        '*823*3*mobile no.#', blackColor),
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
                            'lib/assets/tf_call.svg',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   PageTransition(
                    //     child: Bottomnavigation(
                    //       initialIndex: 4, // Main index
                    //       initialSubIndex:
                    //           35, // Sub-index for MeScreen (SettingsScreen)
                    //     ),
                    //     type: PageTransitionType.leftToRight
                    //     duration: Duration(seconds: 1),
                    //   ),
                    // );
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.08), // Set the shadow color
                                    offset: Offset(
                                        0, 4), // Horizontal and vertical offset
                                    blurRadius:
                                        4, // How much the shadow should be blurred
                                  ),
                                ],
                                color: Color.fromRGBO(220, 229, 239, 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: svgAsset(
                                'lib/assets/tf_airtime.svg',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(),
                                    child:
                                        w500_17(context, 'Betting', blackColor),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(),
                                    child: w400_11_soft_wrap(
                                        '*823*3#', blackColor),
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
                            'lib/assets/tf_call.svg',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   PageTransition(
                    //     child: Bottomnavigation(
                    //       initialIndex: 4, // Main index
                    //       initialSubIndex:
                    //           35, // Sub-index for MeScreen (SettingsScreen)
                    //     ),
                    //     type: PageTransitionType.leftToRight
                    //     duration: Duration(seconds: 1),
                    //   ),
                    // );
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.08), // Set the shadow color
                                    offset: Offset(
                                        0, 4), // Horizontal and vertical offset
                                    blurRadius:
                                        4, // How much the shadow should be blurred
                                  ),
                                ],
                                color: Color.fromRGBO(220, 229, 239, 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: svgAsset(
                                'lib/assets/tf_checkBalance.svg',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(),
                                    child: w500_17(
                                        context, 'Check Balance', blackColor),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(),
                                    child: w400_11_soft_wrap(
                                        '*823*3#', blackColor),
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
                            'lib/assets/tf_call.svg',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   PageTransition(
                    //     child: Bottomnavigation(
                    //       initialIndex: 4, // Main index
                    //       initialSubIndex:
                    //           35, // Sub-index for MeScreen (SettingsScreen)
                    //     ),
                    //     type: PageTransitionType.leftToRight
                    //     duration: Duration(seconds: 1),
                    //   ),
                    // );
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.08), // Set the shadow color
                                    offset: Offset(
                                        0, 4), // Horizontal and vertical offset
                                    blurRadius:
                                        4, // How much the shadow should be blurred
                                  ),
                                ],
                                color: Color.fromRGBO(220, 229, 239, 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: svgAsset(
                                'lib/assets/tf_cardActivation.svg',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(),
                                    child: w500_17(
                                        context, 'Card Activation', blackColor),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(),
                                    child: w400_11_soft_wrap(
                                        '*823*03121#', blackColor),
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
                            'lib/assets/tf_call.svg',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   PageTransition(
                    //     child: Bottomnavigation(
                    //       initialIndex: 4, // Main index
                    //       initialSubIndex:
                    //           35, // Sub-index for MeScreen (SettingsScreen)
                    //     ),
                    //     type: PageTransitionType.leftToRight
                    //     duration: Duration(seconds: 1),
                    //   ),
                    // );
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.08), // Set the shadow color
                                    offset: Offset(
                                        0, 4), // Horizontal and vertical offset
                                    blurRadius:
                                        4, // How much the shadow should be blurred
                                  ),
                                ],
                                color: Color.fromRGBO(220, 229, 239, 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: svgAsset(
                                'lib/assets/tf_getOtp.svg',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(),
                                    child:
                                        w500_17(context, 'Get OTP', blackColor),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(),
                                    child: w400_11_soft_wrap(
                                        '*823*3*mobile no.#', blackColor),
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
                            'lib/assets/tf_call.svg',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(color: textFieldBorderColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

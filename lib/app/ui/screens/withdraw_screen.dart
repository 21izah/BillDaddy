import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:page_transition/page_transition.dart';

import '../../utils/constants/data_constant.dart';
import 'bottomNavigation.dart';
import 'cardTabCSreen.dart';
import 'nearby_merchant_screen.dart';
import 'withdraw_screen02.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background02,
      appBar: AppBar(
        backgroundColor: whiteColor,
        leadingWidth: 300,
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
                    Get.offAllNamed('/bottomNav', arguments: 0);
                    // Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: w600_17(context, 'Withdraw', blackColor),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
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
                      Navigator.of(context).push(
                        PageTransition(
                            child: WithdrawScreen02(),
                            type: PageTransitionType.leftToRight
                            // duration: Duration(seconds: 1),
                            ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Row(
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
                                  child: Image.asset(
                                    'lib/assets/tEgologo.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(),
                                          child: w500_14(
                                              context,
                                              'Withdraw via EgoFinance merchants',
                                              blackColor),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(),
                                          child: w400_12(
                                              context,
                                              'Send money to EgoFinance merchant’s wallet and get cash equivalent.',
                                              blackColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                      Navigator.of(context).push(
                        PageTransition(
                            child: Cardtabcsreen(),
                            type: PageTransitionType.leftToRight
                            // duration: Duration(seconds: 1),
                            ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Row(
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
                                  child: Image.asset(
                                    'lib/assets/tEgologo.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(),
                                          child: w500_14(
                                              context,
                                              'Withdraw with EgoFinance Card',
                                              blackColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color.fromRGBO(220, 229, 239, 1),
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
                      Navigator.of(context).push(
                        PageTransition(
                            child: NearbyMerchantScreen(),
                            type: PageTransitionType.leftToRight
                            // duration: Duration(seconds: 1),
                            ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Row(
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
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: svgAsset(
                                    'lib/assets/tEgo02.svg',
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(),
                                          child: w500_14(
                                              context,
                                              'Find available merchant or ATM around you.',
                                              blackColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
          ],
        ),
      ),
    );
  }
}

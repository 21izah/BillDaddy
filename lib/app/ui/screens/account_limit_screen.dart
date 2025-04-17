import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/data_constant.dart';

class AccountLimitScreen extends StatefulWidget {
  const AccountLimitScreen({super.key});

  @override
  State<AccountLimitScreen> createState() => _AccountLimitScreenState();
}

class _AccountLimitScreenState extends State<AccountLimitScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background02,
      appBar: AppBar(
        backgroundColor: whiteColor,
        leadingWidth: screenSize.width * 0.8,
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
                    Get.toNamed('/me');
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: w400_20(context, 'Account Limit', blackColor),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                color: whiteColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    w500_20(
                      context,
                      'Account Tier',
                      blackColor,
                    ),
                    Row(
                      children: [
                        svgAsset(
                          'lib/assets/aL_medal02.svg',
                        ),
                        w400_17(
                          context,
                          ' Tier 2',
                          blackColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: screenSize.height * 0.8,
            child: ListView(
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.fromLTRB(14, 10, 14, 30),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: Color(
                                  0x40C4C4C4), // #C4C4C440 with 25% opacity
                              offset:
                                  Offset(0, 4), // 0px on x-axis, 4px on y-axis
                              blurRadius: 8, // 8px blur radius
                              spreadRadius: 0, // 0px spread radius (optional)
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, bottom: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'lib/assets/aL_medal.png',
                                    fit: BoxFit.scaleDown,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child:
                                        w400_17(context, 'Tier 1', blackColor),
                                  ),
                                ],
                              ),
                            ),
                            Divider(color: textFieldBorderColor),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 30.0, bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  w400_14(
                                    context,
                                    'Daily transaction limit ',
                                    Color.fromRGBO(51, 51, 51, 0.7),
                                  ),
                                  w500_17_03(
                                    context,
                                    '₦100,000',
                                    blackColor,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 15.0, bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  w400_14(
                                    context,
                                    'Maximum balance ',
                                    Color.fromRGBO(51, 51, 51, 0.7),
                                  ),
                                  w500_17_03(
                                    context,
                                    '₦500,000',
                                    blackColor,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(4, 140, 252, 0.15),
                          boxShadow: [
                            BoxShadow(
                              color: Color(
                                  0x40C4C4C4), // #C4C4C440 with 25% opacity
                              offset:
                                  Offset(0, 4), // 0px on x-axis, 4px on y-axis
                              blurRadius: 8, // 8px blur radius
                              spreadRadius: 0, // 0px spread radius (optional)
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 00.0, bottom: 5),
                              child: Container(
                                padding: EdgeInsets.fromLTRB(14, 17, 14, 17),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(10)),
                                  color: secondaryColor,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    svgAsset(
                                      'lib/assets/aL_medal03.svg',
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: w400_17(
                                          context, 'Tier 2', whiteColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 30.0, bottom: 5, left: 14, right: 14),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  w400_14(
                                    context,
                                    'Daily transaction limit ',
                                    Color.fromRGBO(51, 51, 51, 0.7),
                                  ),
                                  w500_17_03(
                                    context,
                                    '₦100,000',
                                    blackColor,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15.0, bottom: 5, left: 14, right: 14),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  w400_14(
                                    context,
                                    'Maximum balance ',
                                    Color.fromRGBO(51, 51, 51, 0.7),
                                  ),
                                  w500_17_03(
                                    context,
                                    '₦500,000',
                                    blackColor,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.fromLTRB(14, 10, 30, 14),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: Color(
                                  0x40C4C4C4), // #C4C4C440 with 25% opacity
                              offset:
                                  Offset(0, 4), // 0px on x-axis, 4px on y-axis
                              blurRadius: 8, // 8px blur radius
                              spreadRadius: 0, // 0px spread radius (optional)
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, bottom: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'lib/assets/aL_medal.png',
                                    fit: BoxFit.scaleDown,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child:
                                        w400_17(context, 'Tier 3', blackColor),
                                  ),
                                ],
                              ),
                            ),
                            Divider(color: textFieldBorderColor),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 30.0, bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  w400_14(
                                    context,
                                    'Daily transaction limit ',
                                    Color.fromRGBO(51, 51, 51, 0.7),
                                  ),
                                  w500_17_03(
                                    context,
                                    '₦5,000,000',
                                    blackColor,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 15.0, bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  w400_14(
                                    context,
                                    'Maximum balance',
                                    Color.fromRGBO(51, 51, 51, 0.7),
                                  ),
                                  w500_17_03(
                                    context,
                                    'Unlimited',
                                    blackColor,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.of(context).push(
                          //   PageTransition(
                          //     child: Bottomnavigation(
                          //       initialIndex: 4, // Main index
                          //       initialSubIndex:
                          //           15, // Sub-index for MeScreen (SettingsScreen)
                          //     ),
                          //     type: PageTransitionType.leftToRight
                          //     duration: Duration(seconds: 1),
                          //   ),
                          // );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 20,
                            bottom: screenSize.height * 0.02,
                          ),
                          child: Container(
                            height: screenSize.height * 0.06,
                            width: screenSize.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: secondaryColor),
                            child: Center(
                                child: w500_17(
                                    context, 'Upgrade to Tier 3', whiteColor)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// import 'package:hive_flutter/hive_flutter.dart';

import '../../utils/constants/data_constant.dart';
import 'bottomNavigation.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background02,
      appBar: AppBar(
        centerTitle: false,
        title: w700_24(
          context,
          'Settings',
          blackColor,
        ),
        backgroundColor: whiteColor,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 10, 10, 170),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
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
                        Get.toNamed('/me/loginSetting');
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: svgAsset(
                                    'lib/assets/loginSettingsLogo.svg',
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(),
                                        child: w600_15(context,
                                            'Login Settings', blackColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                              width: 15,
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
                        Get.toNamed('/savingSetting');
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: svgAsset(
                                    'lib/assets/savingSettingsLogo.svg',
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(),
                                        child: w600_15(context,
                                            'Savings Settings', blackColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                              width: 15,
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
                        Get.toNamed('/paymentSettings');
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: svgAsset(
                                    'lib/assets/paymentSettingsLogo.svg',
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(),
                                        child: w600_15(context,
                                            'Payment Settings', blackColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                              width: 15,
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
                        // context.go('/setSecurityQuestion');
                        Get.toNamed('/setSecurityQuestion');
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: svgAsset(
                                    'lib/assets/securityQ.svg',
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(),
                                        child: w600_15(context,
                                            'Security Question', blackColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                              width: 15,
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
                        // context.go('/setAlertSubscription');
                        Get.toNamed('/setAlertSubscription');
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: svgAsset(
                                    'lib/assets/smsAlert.svg',
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(),
                                        child: w600_15(
                                            context,
                                            'SMS Alert Subscription',
                                            blackColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                              width: 15,
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
                        // context.go('/scheduledPayment');
                        Get.toNamed('/scheduledPayment');
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: svgAsset(
                                    'lib/assets/scheduledPaymetL.svg',
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(),
                                        child: w600_15(context,
                                            'Scheduled Payments', blackColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                              width: 15,
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
                        // context.go('/about');
                        Get.toNamed('/about');
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: svgAsset(
                                    'lib/assets/aboutLogo.svg',
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(),
                                        child: w600_15(
                                            context, 'About', blackColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                              width: 15,
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
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await box.write('fullName', '');
                        // await _username.put('fullName', '');
                        // Reset navigation state to the Home tab
                        // GoRouter.of(context).go('/home');
                        Get.offAllNamed('/bottomNav', arguments: 0);

                        // Navigate to the login screen

                        Get.offAllNamed('/loginScreen');
                      },
                      child: w600_17(context, 'Sign Out', secondaryColor),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/data_constant.dart';

class AboutEgofinanceScreen extends StatefulWidget {
  const AboutEgofinanceScreen({super.key});

  @override
  State<AboutEgofinanceScreen> createState() => _AboutEgofinanceScreenState();
}

class _AboutEgofinanceScreenState extends State<AboutEgofinanceScreen> {
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
                    // context.pushReplacement('/me');
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
                  child: w600_17(context, 'About', blackColor),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: screenSize.height * 0.15, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset(
                      'lib/assets/egoFI01.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                w600_17(context, 'Version 1.6.7.809',
                    Color.fromRGBO(51, 51, 51, 0.7)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  w600_17(context, 'Your app version is up to date',
                      secondaryColor),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: screenSize.height * 0.15),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(39, 124, 165, 0.25)),
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
                      Get.toNamed('/terms');
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'lib/assets/termsAndCon.png',
                                fit: BoxFit.contain,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(),
                                      child: w600_17(context,
                                          'Terms & Conditions', blackColor),
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
                      Get.toNamed('/privacy');
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              svgAsset(
                                'lib/assets/privacyPolicy01.svg',
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(),
                                      child: w600_17(context, 'Privacy Policy',
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

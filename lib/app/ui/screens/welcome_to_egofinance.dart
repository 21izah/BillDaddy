import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/data_constant.dart';
import 'bottomNavigation.dart';

class WelcomeToEgofinance extends StatefulWidget {
  const WelcomeToEgofinance({super.key});

  @override
  State<WelcomeToEgofinance> createState() => _WelcomeToEgofinanceState();
}

class _WelcomeToEgofinanceState extends State<WelcomeToEgofinance> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: screenSize.height,
            // Apply the linear gradient
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(
                    -0.151, -1), // Adjust the angle (approx. 98.98deg)
                end: Alignment(1, 0), // Direction for gradient flow
                colors: [
                  Color(0xFF00303C), // #00303C
                  Color(0xFF003D50), // #003D50
                ],
                stops: [
                  0.1091,
                  1.0693
                ], // Mapping the percentage stops (10.91%, 106.93%)
              ),
            ),
            child: Stack(
              children: [
                Container(
                  height: screenSize.height * 0.7,
                  width: screenSize.width,
                  child: Image.asset(
                    'lib/assets/Backgroundback01.png',
                    // fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: screenSize.height * 0.28,
                  left: screenSize.width * 0.06,
                  child: Container(
                    height: screenSize.height * 0.2,
                    width: screenSize.width * 0.6,
                    child: Image.asset(
                      'lib/assets/phone01.png',
                      fit: BoxFit.contain, // Makes the image cover the area
                    ),
                  ),
                ),
                Positioned(
                  top: screenSize.height * 0.35,
                  left: screenSize.width * 0.35,
                  child: Container(
                    height: screenSize.height * 0.2,
                    width: screenSize.width * 0.6,
                    child: Image.asset(
                      'lib/assets/phone02.png',
                      fit: BoxFit.contain, // Makes the image cover the area
                    ),
                  ),
                ),
                Positioned(
                  top: screenSize.height * 0.6,
                  left: screenSize.width * 0.02,
                  right: screenSize.width * 0.02,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: w700_27(
                          context,
                          'Welcome to EgoFinance',
                          whiteColor,
                        ),
                      ),
                      w700_27(
                        context,
                        'Bank App',
                        whiteColor,
                      ),
                      w400_14(
                          context,
                          'Start enjoying seamless transactions...',
                          whiteColor),
                    ],
                  ),
                ),
                Positioned(
                  bottom: screenSize.height * 0.1,
                  left: 20,
                  right: 20,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: screenSize.height * 0.06,
                      // left: 10,
                      // right: 10,
                      bottom: screenSize.height * 0.02,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Get.offAllNamed('/bottomNav', arguments: 0);
                      },
                      child: Container(
                        height: screenSize.height * 0.06,
                        width: screenSize.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: secondaryColor),
                        child: Center(
                            child: w500_17(context, 'Get Started', whiteColor)),
                      ),
                    ),
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

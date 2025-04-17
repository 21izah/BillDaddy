import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';

import '../../utils/constants/data_constant.dart';
import 'welcome_to_egofinance.dart';

class VerifyIdentityScreen extends StatefulWidget {
  const VerifyIdentityScreen({super.key});

  @override
  State<VerifyIdentityScreen> createState() => _VerifyIdentityScreenState();
}

class _VerifyIdentityScreenState extends State<VerifyIdentityScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
        padding: EdgeInsets.only(
          // bottom: screenSize.height * 0.15,
          top: screenSize.height * 0.015,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: screenSize.height * 0.5,
                  width: screenSize.width * 0.5,
                  child: Image.asset(
                    'lib/assets/woodHand.png',
                    // fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: w700_27(
                    context,
                    'Verify your Identity!',
                    blackColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: w400_14(
                    context,
                    'Verify your Identity using your NIN or BVN.',
                    textColorSecondary,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  PageTransition(
                      child: WelcomeToEgofinance(),
                      type: PageTransitionType.leftToRight
                      // duration: Duration(seconds: 1),
                      ),
                );
              },
              child: Padding(
                padding: EdgeInsets.only(
                  top: screenSize.height * 0.06,
                  left: 20,
                  right: 20,
                  bottom: screenSize.height * 0.02,
                ),
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
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: w500_17(
                  context,
                  'Skip Now',
                  blackColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

import '../../utils/constants/data_constant.dart';
import 'bottomNavigation.dart';

class TopUpDSuccessfulScreen extends StatefulWidget {
  const TopUpDSuccessfulScreen({super.key});

  @override
  State<TopUpDSuccessfulScreen> createState() => _TopUpDSuccessfulScreenState();
}

class _TopUpDSuccessfulScreenState extends State<TopUpDSuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: screenSize.height * 0.15),
              height: 150,
              width: 150,
              child: Lottie.asset('lib/assets/checkAnimation.json'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: w600_24(
                context,
                'Wallet Credited',
                Color.fromRGBO(51, 51, 51, 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: w400_14(
                context,
                'Your wallet has been credited with 19,000 NGN',
                Color.fromRGBO(51, 51, 51, 1),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.offAllNamed('/bottomNav', arguments: 0);
              },
              child: Container(
                height: screenSize.height * 0.06,
                width: screenSize.width,
                margin: EdgeInsets.only(top: screenSize.height * 0.1),
                decoration: BoxDecoration(
                  border: Border.all(color: secondaryColor),
                  borderRadius: BorderRadius.circular(0),
                  color: whiteColor,
                ),
                child: Center(
                  child: w500_17(context, 'Check Wallet', secondaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

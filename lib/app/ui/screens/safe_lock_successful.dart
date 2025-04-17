import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

import '../../utils/constants/data_constant.dart';

class SafeLockSuccessful extends StatefulWidget {
  const SafeLockSuccessful({super.key});

  @override
  State<SafeLockSuccessful> createState() => _SafeLockSuccessfulState();
}

class _SafeLockSuccessfulState extends State<SafeLockSuccessful> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            20, screenSize.height * 0.1, 20, screenSize.height * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              child: Lottie.asset('lib/assets/checkAnimation.json'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 20),
              child: w700_20(context, 'Payment Successful!!!', blackColor),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                w400_14(
                  context,
                  'You have safelocked ',
                  Color.fromRGBO(51, 51, 51, 0.7),
                ),
                w600_14(
                  context,
                  'NGN 102,400.00.',
                  Color.fromRGBO(51, 51, 51, 1),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                w400_14(
                  context,
                  'Start earning interest.',
                  Color.fromRGBO(51, 51, 51, 0.7),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed('/safeLockBalance');
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: screenSize.height * 0.1),
                height: 40,
                width: screenSize.width,
                decoration: BoxDecoration(
                  color: secondaryColor,
                  border: Border.all(color: Color.fromRGBO(4, 140, 252, 0.5)),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: w500_14(
                  context,
                  'Done',
                  whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

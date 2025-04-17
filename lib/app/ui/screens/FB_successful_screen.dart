import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

import '../../utils/constants/data_constant.dart';

class FbSuccessfulScreen extends StatefulWidget {
  const FbSuccessfulScreen({super.key});

  @override
  State<FbSuccessfulScreen> createState() => _FbSuccessfulScreenState();
}

class _FbSuccessfulScreenState extends State<FbSuccessfulScreen> {
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
              child: w700_20(context, 'Saved Successfully!!!', blackColor),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                w400_14(context, 'PIN changed successfully.',
                    Color.fromRGBO(51, 51, 51, 0.7)),
              ],
            ),
            GestureDetector(
              onTap: () {
                // context.go('/paymentSettings');
                Get.toNamed('/paymentSettings');
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: screenSize.height * 0.15),
                height: 40,
                width: screenSize.width,
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromRGBO(4, 140, 252, 0.5)),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: w500_14(
                  context,
                  'Done',
                  Color.fromRGBO(4, 140, 252, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/data_constant.dart';
import 'bottomNavigation.dart';

class CardDetailsSent extends StatefulWidget {
  const CardDetailsSent({super.key});

  @override
  State<CardDetailsSent> createState() => _CardDetailsSentState();
}

class _CardDetailsSentState extends State<CardDetailsSent> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                'lib/assets/success01.png',
                // fit: BoxFit.contain,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: w700_20(context, 'Security', blackColor),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: w400_14(context,
                  'Your details has been sent. You will receive', blackColor),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 5,
                bottom: 70,
              ),
              child: w400_14(
                  context, 'notification on your card status', blackColor),
            ),
            GestureDetector(
              onTap: () {
                Get.offAllNamed('/bottomNav', arguments: 0);
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(),
                height: 40,
                width: screenSize.width,
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromRGBO(4, 140, 252, 0.5)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: w500_14(context, 'Back to Dashboard',
                    Color.fromRGBO(4, 140, 252, 1)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

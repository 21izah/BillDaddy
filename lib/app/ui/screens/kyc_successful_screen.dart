import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

import '../../utils/constants/data_constant.dart';

class KycSuccessfulScreen extends StatefulWidget {
  const KycSuccessfulScreen({super.key});

  @override
  State<KycSuccessfulScreen> createState() => _KycSuccessfulScreenState();
}

class _KycSuccessfulScreenState extends State<KycSuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: screenSize.height * 0.15),
                height: 150,
                width: 150,
                child: Lottie.asset('lib/assets/checkAnimation.json'),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenSize.height * 0.02),
                child: w600_24(
                  context,
                  'Identity Verified!',
                  Color.fromRGBO(51, 51, 51, 1),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/me');
                },
                child: Container(
                  height: screenSize.height * 0.06,
                  width: screenSize.width,
                  margin: EdgeInsets.only(top: screenSize.height * 0.45),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: secondaryColor,
                  ),
                  child: Center(
                    child: w500_17(context, 'Continue', whiteColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

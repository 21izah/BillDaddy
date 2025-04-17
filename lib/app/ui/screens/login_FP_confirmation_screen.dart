import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/data_constant.dart';

class LoginFpConfirmationScreen extends StatefulWidget {
  const LoginFpConfirmationScreen({super.key});

  @override
  State<LoginFpConfirmationScreen> createState() =>
      _LoginFpConfirmationScreenState();
}

class _LoginFpConfirmationScreenState extends State<LoginFpConfirmationScreen> {
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
                    Get.offAllNamed('/loginVerifyPhoneNumber');
                    // Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: w600_17(context, 'Confirmation', blackColor),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: screenSize.height * 0.05),
              height: 382,
              width: 382,
              color: colrs,
              // child: Image.asset('assets/images/facebook.png',
              //     height: 100, width: 100),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.offAllNamed('/loginVerifyPhoneNumber');
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 0),
                      height: 40,
                      width: screenSize.width * 0.42,
                      decoration: BoxDecoration(
                        border: Border.all(color: secondaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: w500_14(context, 'Retry', secondaryColor),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/loginFpNewPassword');
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: screenSize.width * 0.42,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: w500_14(context, 'Confirm', whiteColor),
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

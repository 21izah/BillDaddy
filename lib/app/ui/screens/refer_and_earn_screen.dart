import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/data_constant.dart';

class ReferAndEarnScreen extends StatefulWidget {
  const ReferAndEarnScreen({super.key});

  @override
  State<ReferAndEarnScreen> createState() => _ReferAndEarnScreenState();
}

class _ReferAndEarnScreenState extends State<ReferAndEarnScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
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
                  child: w600_17(context, 'Refer and earn', blackColor),
                ),
              ],
            ),
          ),
        ),
      ),
      // appBar: AppBar(
      //   title: w600_17(context, 'Refer and earn', blackColor),
      //   centerTitle: false,
      // ),
      backgroundColor: Color.fromRGBO(243, 244, 246, 1),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              // height: screenSize.height * 0.5,
              // width: screenSize.width * 0.5,
              child: Image.asset(
                'lib/assets/refer&earn01.png',
                height: 426.46,
                width: 350,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    // This ensures the text wraps properly
                    child: RichText(
                      textAlign: TextAlign.center, // Center-aligns the text
                      text: TextSpan(
                        style: w400_12_s(context, blackColor),
                        children: [
                          TextSpan(
                            text:
                                'Earn 800 Naira cashback by refering your friend.',
                            style: w400_17_s(
                              context,
                              blackColor,
                            ),
                          ),
                          // TextSpan(
                          //   text: ' 907****400',
                          //   style: w700_17_s(
                          //     context,
                          //     Color.fromRGBO(51, 51, 51, 0.71),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     w500_17(context, 'Earn 800 Naira cashback by refering',
            //         blackColor),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     w500_17(context, 'your friend.', blackColor),
            //   ],
            // ),
            Padding(
              padding: EdgeInsets.only(top: screenSize.height * 0.0),
              child: _buildSignInButton(screenSize),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignInButton(Size screenSize) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.only(
          top: 25,
          left: screenSize.width * 0.02,
          right: screenSize.width * 0.02,
          bottom: 30,
        ),
        child: Container(
          height: screenSize.height * 0.06,
          width: screenSize.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: secondaryColor,
          ),
          child: Center(
            child: w500_17(context, 'Invite Friends', whiteColor),
          ),
        ),
      ),
    );
  }
}

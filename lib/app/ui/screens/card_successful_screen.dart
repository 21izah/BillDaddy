import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

import '../../utils/constants/data_constant.dart';

class CardSuccessfulScreen extends StatefulWidget {
  const CardSuccessfulScreen({super.key});

  @override
  State<CardSuccessfulScreen> createState() => _CardSuccessfulScreenState();
}

class _CardSuccessfulScreenState extends State<CardSuccessfulScreen> {
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
              child: w700_20(context, 'Payment Successful', blackColor),
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
                                'Your Payment for EgoFinance Card Application is successful',
                            style: w400_12_s(
                              context,
                              Color.fromRGBO(51, 51, 51, 0.71),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Container(
            //       child: w400_14(
            //           context,
            //           'Your Payment for EgoFinance Card Application is',
            //           Color.fromRGBO(51, 51, 51, 0.7)),
            //     ),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     w400_14(context, 'succussful. Kindly wait for approval',
            //         Color.fromRGBO(51, 51, 51, 0.7)),
            //   ],
            // ),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => GiftcardShareScreen()),
                // );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(5, 71, 138, 0.06),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.only(top: 40, bottom: 50),
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(4, 140, 252, 0.15),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: svgAsset(
                            'lib/assets/shareReceipt.svg',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(),
                                child: w400_14(
                                    context, 'Share Receipt', blackColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        right: 10,
                      ),
                      height: 22,
                      width: 22,
                      child: svgAsset(
                        'lib/assets/share-24.svg',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed('/cardTab02');
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(),
                height: 40,
                width: screenSize.width,
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromRGBO(4, 140, 252, 0.5)),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: w500_14(
                  context,
                  'Back to Dashboard',
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

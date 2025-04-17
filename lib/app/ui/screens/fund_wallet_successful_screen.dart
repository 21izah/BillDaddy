import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

import '../../utils/constants/data_constant.dart';
import 'bottomNavigation.dart';

class FundWalletSuccessfulScreen extends StatefulWidget {
  const FundWalletSuccessfulScreen({super.key});

  @override
  State<FundWalletSuccessfulScreen> createState() =>
      _FundWalletSuccessfulScreenState();
}

class _FundWalletSuccessfulScreenState
    extends State<FundWalletSuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            20, screenSize.height * 0.1, 20, screenSize.height * 0.1),
        child: ListView(
          children: [
            Container(
              height: 150,
              width: 150,
              child: Lottie.asset('lib/assets/checkAnimation.json'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  w700_20(context, 'Successful', blackColor),
                ],
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
                        style: w500_14_s(context, blackColor),
                        children: [
                          TextSpan(
                            text:
                                'Your verve card will be funded with ₦1,000.00',
                            style: w500_14_s(
                              context,
                              blackColor,
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
            //     w400_14(
            //         context,
            //         '',
            //         Color.fromRGBO(51, 51, 51, 1)),
            //   ],
            // ),
            GestureDetector(
              onTap: () {
                // Navigator.of(context).push(
                //   PageTransition(
                //     child: InternetShareScreen(),
                //     type: PageTransitionType.leftToRight
                //     duration: Duration(seconds: 1),
                //   ),
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
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: w400_20(context, 'Get your Rewards', blackColor),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromRGBO(243, 243, 243, 1),
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        Container(
                          height: screenSize.width * 0.1,
                          width: screenSize.width * 0.1,
                          padding: EdgeInsets.all(screenSize.width * 0.02),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Transform.scale(
                            scale: 1.9,
                            child: Image.asset(
                              'lib/assets/handDollar.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(width: screenSize.width * 0.03),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  w500_14_05(
                                    context,
                                    'Win  ',
                                    Color.fromRGBO(143, 12, 176, 1),
                                  ),
                                  w500_16(
                                    context,
                                    '#',
                                    Color.fromRGBO(143, 12, 176, 1),
                                  ),
                                  w500_16(
                                    context,
                                    '350,000',
                                    Color.fromRGBO(143, 12, 176, 1),
                                  ),
                                  w500_14_05(
                                    context,
                                    '  Today',
                                    Color.fromRGBO(143, 12, 176, 1),
                                  ),
                                ],
                              ),
                              SizedBox(height: screenSize.height * 0.005),
                              Container(
                                child: w400_16_k(
                                    context,
                                    'transact with your EgoFinance Verve Card now',
                                    blackColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(9.39),
                    ),
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.all(10),
                    height: 34,
                    // width: 66,
                    child: Center(child: w700_14(context, 'Go', whiteColor)),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color.fromRGBO(217, 217, 217, 1),
                  ),
                ),
                margin: EdgeInsets.only(
                    top: screenSize.height * 0.01,
                    bottom: screenSize.height * 0.02),
                padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(),
                            child: svgAsset(
                              'lib/assets/soccer01.svg',
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(),
                                    child: w500_17(context,
                                        'Bet now and win Big!', blackColor),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(),
                                    child: w400_12(context,
                                        'Enjoy great Discounts!', blackColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: EdgeInsets.only(
                        right: 10,
                      ),
                      height: 34,
                      width: 66,
                      child: Center(child: w700_14(context, 'Go', whiteColor)),
                    ),
                  ],
                ),
              ),
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

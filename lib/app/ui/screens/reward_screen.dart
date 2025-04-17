import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/data_constant.dart';

class RewardScreen extends StatefulWidget {
  const RewardScreen({super.key});

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0, left: 3),
            child: w400_14(
              context,
              'Voucher',
              blackColor,
            ),
          ),
        ],
        centerTitle: false,
        title: w600_17(
          context,
          'Rewards',
          blackColor,
        ),
        backgroundColor: whiteColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: whiteColor,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 10, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(255, 180, 33, 1),
                                ),
                                child: w600_20(
                                  context,
                                  '₦',
                                  whiteColor,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, right: 8),
                                child: w400_12_r(
                                  context,
                                  'Cashback',
                                  blackColor,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                  border: Border.all(color: blackColor),
                                  shape: BoxShape.circle,
                                  color: whiteColor,
                                ),
                                child: w500_10(
                                  context,
                                  '?',
                                  blackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            w600_20(
                              context,
                              '0',
                              blackColor,
                            ),
                            Container(
                              height: 15,
                              width: 15,
                              child: svgAsset(
                                'lib/assets/vright_arrow.svg',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 5, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            w600_20(
                              context,
                              '₦ 8.97',
                              blackColor,
                            ),
                            Container(
                              height: 15,
                              width: 15,
                              child: svgAsset(
                                'lib/assets/vright_arrow.svg',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 10, 20, 10),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed('/payment');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Color.fromRGBO(248, 248, 248, 1),
                                  ),
                                  child: Image.asset(
                                    'lib/assets/calendar.png',
                                    height: 20,
                                    width: 20,
                                    // fit: BoxFit.scaleDown,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        w600_12(
                                          context,
                                          'Daily cashback',
                                          blackColor,
                                        ),
                                        w400_11(
                                          'Check in and get 1 - 20 cashback at random',
                                          blackColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: secondaryColor,
                            ),
                            child: w600_11(
                              context,
                              'Get Now',
                              whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Divider(color: textFieldBorderColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30.0, 20, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        w600_11(
                          context,
                          'Daily Bonus',
                          blackColor,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 10, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Color.fromRGBO(248, 248, 248, 1),
                                ),
                                child: Image.asset(
                                  'lib/assets/mobile.png',
                                  height: 20,
                                  width: 20,
                                  // fit: BoxFit.scaleDown,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      w600_12(
                                        context,
                                        'Airtime',
                                        blackColor,
                                      ),
                                      w400_11(
                                        'Buy Airtime and get up to 3% cashback',
                                        blackColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: secondaryColor,
                          ),
                          child: w600_11(
                            context,
                            '3%',
                            whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Divider(color: textFieldBorderColor),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.fromLTRB(10, 10, 20, 10),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Color.fromRGBO(248, 248, 248, 1),
                          ),
                          child: Image.asset(
                            'lib/assets/bar-chart.png',
                            height: 20,
                            width: 20,
                            // fit: BoxFit.scaleDown,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                w600_12(
                                  context,
                                  'Data',
                                  blackColor,
                                ),
                                w400_11(
                                  'Buy Data and get up to 3% Cashback',
                                  blackColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: secondaryColor,
                    ),
                    child: w600_11(
                      context,
                      '3%',
                      whiteColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: screenSize.height * 0.3,
              width: screenSize.width,
              child: svgAsset(
                'lib/assets/reward004.svg',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  w600_14(
                    context,
                    'Refer & Earn Cashback',
                    blackColor,
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

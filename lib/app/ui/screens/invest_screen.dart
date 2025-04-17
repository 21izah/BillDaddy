import 'package:billdaddy/app/utils/constants/nav_ids.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/constants/data_constant.dart';

class InvestScreen extends StatefulWidget {
  const InvestScreen({super.key});

  @override
  State<InvestScreen> createState() => _InvestScreenState();
}

class _InvestScreenState extends State<InvestScreen> {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: screenSize.height * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: secondaryColor,
                          child: Icon(
                            Icons.person,
                            color: whiteColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  w400_10(context, 'Welcome, ', blackColor),
                                  Image.asset(
                                    'lib/assets/hand.png',
                                    height: 14,
                                    width: 14,
                                    // fit: BoxFit.scaleDown,
                                  ),
                                ],
                              ),
                              w500_12(context, '${box.read('fullName')}' ?? '',
                                  blackColor),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 24,
                          width: 24,
                          child: svgAsset(
                            'lib/assets/scan01.svg',
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          height: 24,
                          width: 24,
                          child: svgAsset(
                            'lib/assets/notificatoin.svg',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: screenSize.height * 0.3,
                width: screenSize.width * 0.6,
                margin: EdgeInsets.only(
                    top: screenSize.height * 0.05,
                    bottom: screenSize.height * 0.02),
                padding: EdgeInsets.all(0),
                child: svgAsset(
                  'lib/assets/investLaptop.svg',
                ),
              ),
              w700_18(
                context,
                'Investment made easier',
                blackColor,
              ),
              Container(
                margin: EdgeInsets.only(
                    top: screenSize.height * 0.01,
                    bottom: screenSize.height * 0.05),
                child: w400_14(
                  context,
                  'Buy stocks for a little token',
                  blackColor,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/invest/invest02', id: NavIds.invest);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: screenSize.height * 0.05,
                  width: screenSize.width * 0.8,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: w500_14(context, 'Find Stock', whiteColor),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: screenSize.height * 0.02,
                    bottom: screenSize.height * 0.05),
                child: w400_14(
                  context,
                  'NB: Get an investment advice before investing.',
                  blackColor,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  w400_16(
                    context,
                    'Check investment',
                    blackColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed('/invest/invest02', id: NavIds.invest);
                      },
                      child: w400_16_u(
                        context,
                        'Portfolio',
                        secondaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

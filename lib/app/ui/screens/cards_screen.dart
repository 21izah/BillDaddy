import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/data_constant.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(
                20,
                20,
                20,
                10,
              ),

              // color: Colors.amber,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: RadialGradient(
                  center: Alignment.center, // Center of the container
                  radius: 0.5, // Controls the size of the gradient
                  colors: [
                    Color(0xFF05478A), // Starting color (#05478A)
                    Color(0xFF05478A), // Ending color (#05478A)
                  ],
                  stops: [0.0, 1.0], // Positions of the colors in the gradient
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: w700_18(context, 'Debit', whiteColor),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            child: Image.asset(
                              'lib/assets/Group1logo.png', color: Colors.white,
                              // fit: BoxFit.contain,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: w700_24(context, ' Finance', whiteColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        height: 40,
                        width: 40,
                        child: Image.asset(
                          'lib/assets/sim.png',
                          // fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          w500_17(context, '5355', whiteColor),
                        ],
                      ),
                      Row(
                        children: [
                          w500_17(context, '0429', whiteColor),
                        ],
                      ),
                      Row(
                        children: [
                          w500_17(context, '3583', whiteColor),
                        ],
                      ),
                      Row(
                        children: [
                          w500_17(context, '7240', whiteColor),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 20),
                          child: w400_08(context, 'VALID THRU', whiteColor)),
                      w500_12(context, '06/25', whiteColor),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: w700_12(context, 'HENRY JOHNSON', whiteColor),
                      ),
                      Container(
                        height: 40,
                        width: 100,
                        child: Image.asset(
                          'lib/assets/verve.png',
                          // fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.offAllNamed('/cardApplicationScreen');
                ;
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(0, screenSize.height * 0.04, 0, 10),
                color: Colors.transparent,
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
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.08), // Set the shadow color
                                offset: Offset(
                                    0, 4), // Horizontal and vertical offset
                                blurRadius:
                                    4, // How much the shadow should be blurred
                              ),
                            ],
                            color: Color.fromRGBO(220, 229, 239, 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: svgAsset(
                            'lib/assets/payId.svg',
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
                                child: w600_17(
                                    context, 'Instant Access', blackColor),
                              ),
                              Container(
                                margin: EdgeInsets.only(),
                                child: Row(
                                  children: [
                                    w400_12(context, 'Apply and activate',
                                        blackColor),
                                    w400_12(
                                        context, ' instantly', secondaryColor),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 22,
                      width: 22,
                      child: svgAsset(
                        'lib/assets/vright_arrow.svg',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigator.of(context).push(
                //   PageTransition(
                //     child: Bottomnavigation(
                //       initialIndex: 4, // Main index
                //       initialSubIndex:
                //           36, // Sub-index for MeScreen (SettingsScreen)
                //     ),
                //     type: PageTransitionType.leftToRight
                //     duration: Duration(seconds: 1),
                //   ),
                // );
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(0, screenSize.height * 0.02, 0, 10),
                color: Colors.transparent,
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
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.08), // Set the shadow color
                                offset: Offset(
                                    0, 4), // Horizontal and vertical offset
                                blurRadius:
                                    4, // How much the shadow should be blurred
                              ),
                            ],
                            color: Color.fromRGBO(220, 229, 239, 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: svgAsset(
                            'lib/assets/payId.svg',
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
                                child: w600_17(context,
                                    'Online Merchant Acceptance', blackColor),
                              ),
                              Container(
                                width: screenSize.width * 0.65,
                                margin: EdgeInsets.only(),
                                child: Expanded(
                                  child: w400_12(
                                      context,
                                      'Accepted by 50,000+ online merchants including JUMIA, KONGA, NETFLIX and others.',
                                      blackColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed('/cardApplicationScreen');
              },
              child: Container(
                margin: EdgeInsets.only(top: screenSize.height * 0.02),
                alignment: Alignment.center,
                height: 45,
                width: screenSize.width * 0.8,
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: w500_14(context, 'Get it for just ₦200', whiteColor),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: screenSize.height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  w400_12(context, 'Licensed by', blackColor),
                  w400_12(context, ' CBN', secondaryColor),
                  w400_12(context, ' Insured by', blackColor),
                  w400_12(context, ' NDIC', secondaryColor),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

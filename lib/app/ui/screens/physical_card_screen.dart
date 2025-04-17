import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/data_constant.dart';

class PhysicalCardScreen extends StatefulWidget {
  const PhysicalCardScreen({super.key});

  @override
  State<PhysicalCardScreen> createState() => _PhysicalCardScreenState();
}

class _PhysicalCardScreenState extends State<PhysicalCardScreen> {
  void openBottomSheet() {
    showModalBottomSheet(
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      backgroundColor: whiteColor,
      context: context,
      builder: (context) {
        final screenSize = MediaQuery.of(context).size;
        return Container(
          margin: EdgeInsets.all(20),
          height: screenSize.height * 0.6,
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      child: svgAsset(
                        'lib/assets/close_icon.svg',
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                  bottom: 20,
                ),
                child: w700_20(context, 'Physical Card', blackColor),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            // height: 40,
                            // width: 40,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(4, 140, 252, 0.15),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: svgAsset(
                              'lib/assets/requestAcard.svg',
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
                                      context, 'Free Usage', blackColor),
                                ),
                                Container(
                                  margin: EdgeInsets.only(),
                                  child: w600_12(
                                      context,
                                      'No card maintenance fee, free withdrawal.',
                                      blackColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // Container(
                      //   height: 22,
                      //   width: 22,
                      // ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            // height: 40,
                            // width: 40,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(4, 140, 252, 0.15),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: svgAsset(
                              'lib/assets/requestAcard.svg',
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
                                  child:
                                      w600_17(context, 'Security', blackColor),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(),
                                      child: w600_12(
                                          context, 'CBN ', secondaryColor),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(),
                                      child: w600_12(
                                          context, 'licensed, ', blackColor),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(),
                                      child: w600_12(
                                          context, 'NDIC ', secondaryColor),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(),
                                      child: w600_12(
                                          context, 'insured', blackColor),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // Container(
                      //   height: 22,
                      //   width: 22,
                      // ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/homeDelivery');
                },
                child: Container(
                  margin: EdgeInsets.only(
                    top: screenSize.height * 0.03,
                    bottom: screenSize.height * 0.01,
                  ),
                  alignment: Alignment.center,
                  height: 40,
                  width: screenSize.width,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:
                      w500_14(context, 'Click for home delivery', whiteColor),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/nearbyMerchant');
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    bottom: screenSize.height * 0.03,
                  ),
                  height: 40,
                  width: screenSize.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromRGBO(4, 140, 252, 0.5)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: w500_14(
                    context,
                    'Pick up from nearby merchant',
                    Color.fromRGBO(4, 140, 252, 1),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

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
              height: 300,
              margin: EdgeInsets.only(
                top: 40,
                bottom: 50,
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 0.0, top: 0, right: 10),
                    child: Container(
                      width: screenSize.width * 0.8,

                      padding: EdgeInsets.all(20),

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
                          stops: [
                            0.0,
                            1.0
                          ], // Positions of the colors in the gradient
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 20,
                                    child: Image.asset(
                                      'lib/assets/Group1logo.png',
                                      color: Colors.white,
                                      // fit: BoxFit.contain,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: w500_14(
                                        context, ' Finance', whiteColor),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  svgAsset(
                                    'lib/assets/volume.svg',
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: screenSize.height * 0.03),
                                height: 40,
                                width: 40,
                                child: Image.asset(
                                  'lib/assets/sim.png',
                                  // fit: BoxFit.contain,
                                ),
                              ),
                              Container(
                                child: w700_18(context, 'Debit', whiteColor),
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
                                  margin: EdgeInsets.only(
                                      top: screenSize.height * 0.02),
                                  child: w400_08(
                                      context, 'VALID THRU', whiteColor)),
                              w500_12(context, '06/25', whiteColor),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: w700_12(
                                    context, 'HENRY JOHNSON', whiteColor),
                              ),
                              Container(
                                height: 40,
                                child: svgAsset(
                                  'lib/assets/mastercard.svg',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // second card
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, top: 0, right: 10),
                    child: Container(
                      width: screenSize.width * 0.8,

                      padding: EdgeInsets.all(20),

                      // color: Colors.amber,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF0085F3), // Starting color #0085F3
                            Color(0xFF0085F3).withOpacity(
                                0.56), // Same color with opacity for the end
                          ],
                          stops: [
                            0.243,
                            0.9604
                          ], // Control how the colors are distributed
                          transform: GradientRotation(239.9 *
                              (3.1416 / 180)), // Convert degrees to radians
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 20,
                                    child: Image.asset(
                                      'lib/assets/Group1logo.png',
                                      color: Colors.white,
                                      // fit: BoxFit.contain,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: w500_14(
                                        context, ' Finance', whiteColor),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  svgAsset(
                                    'lib/assets/volume.svg',
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: screenSize.height * 0.03),
                                height: 40,
                                width: 40,
                                child: Image.asset(
                                  'lib/assets/sim.png',
                                  // fit: BoxFit.contain,
                                ),
                              ),
                              Container(
                                child: w700_18(context, 'Debit', whiteColor),
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
                                  margin: EdgeInsets.only(
                                      top: screenSize.height * 0.02),
                                  child: w400_08(
                                      context, 'VALID THRU', whiteColor)),
                              w500_12(context, '06/25', whiteColor),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: w700_12(
                                    context, 'HENRY JOHNSON', whiteColor),
                              ),
                              Container(
                                height: 40,
                                child: svgAsset(
                                  'lib/assets/mastercard.svg',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // third  card
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, top: 0, right: 10),
                    child: Container(
                      width: screenSize.width * 0.8,

                      padding: EdgeInsets.all(20),

                      // color: Colors.amber,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFEB041F), // #EB041F
                            Color(0xFFF8470B), // #F8470B
                          ],
                          begin: Alignment(-1.0, 0.0), // Starts from the left
                          end: Alignment(
                              1.0, 1.0), // Ends towards the bottom right
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 20,
                                    child: Image.asset(
                                      'lib/assets/Group1logo.png',
                                      color: Colors.white,
                                      // fit: BoxFit.contain,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: w500_14(
                                        context, ' Finance', whiteColor),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  svgAsset(
                                    'lib/assets/volume.svg',
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: screenSize.height * 0.03),
                                height: 40,
                                width: 40,
                                child: Image.asset(
                                  'lib/assets/sim.png',
                                  // fit: BoxFit.contain,
                                ),
                              ),
                              Container(
                                child: w700_18(context, 'Debit', whiteColor),
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
                                margin: EdgeInsets.only(
                                    top: screenSize.height * 0.02),
                                child:
                                    w400_08(context, 'VALID THRU', whiteColor),
                              ),
                              w500_12(context, '06/25', whiteColor),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: w700_12(
                                    context, 'HENRY JOHNSON', whiteColor),
                              ),
                              Container(
                                height: 40,
                                child: svgAsset(
                                  'lib/assets/mastercard.svg',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                openBottomSheet();
              },
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Ensure proper alignment
                  children: [
                    Expanded(
                      // Ensures the text doesn't overflow
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(51, 51, 51, 0.2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: svgAsset(
                              'lib/assets/requestAcard.svg',
                            ),
                          ),
                          SizedBox(width: 10), // Add spacing
                          Expanded(
                            // Ensures text wraps when necessary
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                w600_17(context, 'Request A Card', blackColor),
                                w400_12_o(
                                    context,
                                    'We’ll send it to you wherever you are.',
                                    blackColor),
                              ],
                            ),
                          ),
                        ],
                      ),
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
          ],
        ),
      ),
    );
  }
}

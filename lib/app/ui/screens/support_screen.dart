import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../utils/constants/data_constant.dart';
import 'report_scam_screen.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background02,
      appBar: AppBar(
        centerTitle: false,
        title: w700_24(
          context,
          'Support',
          blackColor,
        ),
        backgroundColor: whiteColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: screenSize.height * 0.01),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x40C4C4C4), // #C4C4C440 with 25% opacity
                      offset: Offset(0, 4), // 0px on x-axis, 4px on y-axis
                      blurRadius: 8, // 8px blur radius
                      spreadRadius: 0, // 0px spread radius (optional)
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,

                          PageTransition(
                            type: PageTransitionType.leftToRight,
                            child: const ReportScamScreen(),
                            duration: Duration(seconds: 1),
                          ),
                          // );
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
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
                                        color: Color.fromRGBO(0, 0, 0,
                                            0.08), // Set the shadow color
                                        offset: Offset(0,
                                            4), // Horizontal and vertical offset
                                        blurRadius:
                                            4, // How much the shadow should be blurred
                                      ),
                                    ],
                                    color: Color.fromRGBO(220, 229, 239, 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Image.asset(
                                    'lib/assets/sup_SecurityCenter.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(),
                                        child: w600_17(context,
                                            'Security Center', blackColor),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(),
                                        child: w400_12(
                                            context,
                                            'Tap to report a scam or restrict your',
                                            blackColor),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(),
                                        child: w400_12(
                                            context, 'account', blackColor),
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
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: screenSize.height * 0.01),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x40C4C4C4), // #C4C4C440 with 25% opacity
                      offset: Offset(0, 4), // 0px on x-axis, 4px on y-axis
                      blurRadius: 8, // 8px blur radius
                      spreadRadius: 0, // 0px spread radius (optional)
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigator.of(context).push(
                        //   PageTransition(
                        //     child: Bottomnavigation(
                        //       initialIndex: 4, // Main index
                        //       initialSubIndex:
                        //           2, // Sub-index for MeScreen (SettingsScreen)
                        //     ),
                        //     type: PageTransitionType.leftToRight
                        //     duration: Duration(seconds: 1),
                        //   ),
                        // );
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
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
                                        color: Color.fromRGBO(0, 0, 0,
                                            0.08), // Set the shadow color
                                        offset: Offset(0,
                                            4), // Horizontal and vertical offset
                                        blurRadius:
                                            4, // How much the shadow should be blurred
                                      ),
                                    ],
                                    color: Color.fromRGBO(220, 229, 239, 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Image.asset(
                                    'lib/assets/sup_officeAddress.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(),
                                        child: w600_17(context,
                                            'Office Address', blackColor),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(),
                                        child: w400_12(
                                            context,
                                            'Customer Service Center Address',
                                            blackColor),
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
                  ],
                ),
              ),
              Stack(
                children: [
                  // Background Image
                  Transform.scale(
                    scaleY: 1.2,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 30),
                      width: screenSize.width,
                      child: Image.asset(
                        'lib/assets/sup_ImageContainer.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Overlay Row for content
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 05),
                        padding: EdgeInsets.only(
                            left: 20), // Adjust padding as needed
                        child: Transform.scale(
                          scale: 1.2, // Adjust scale to fit size
                          child: Image.asset(
                            'lib/assets/sup_humanImage.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),

                      // Text and Icons on the right
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: 10,
                              top: 30,
                              left: screenSize.width * 0.05),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              w400_13(context, 'Card misplaced or stolen?',
                                  Colors.white),
                              w700_24(context, '*831*567#', Colors.white),

                              SizedBox(height: 10),

                              // Bottom Row for license and insurance
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  // CBN Licensing
                                  Row(
                                    children: [
                                      w400_06(context, 'Licensed by CBN',
                                          Colors.white),
                                      SizedBox(width: 5),
                                      Image.asset(
                                        'lib/assets/sup_cbn.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ],
                                  ),

                                  // Separator
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: w600_17(context, '|', Colors.white),
                                  ),

                                  // NDIC Insurance
                                  Row(
                                    children: [
                                      w400_06(
                                          context, 'Insured by', Colors.white),
                                      SizedBox(width: 5),
                                      Image.asset(
                                        'lib/assets/sup_ndic.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 150,
                    width: screenSize.width * 0.45,
                    // margin: EdgeInsets.only(top: screenSize.height * 0.01),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color:
                              Color(0x40C4C4C4), // #C4C4C440 with 25% opacity
                          offset: Offset(0, 4), // 0px on x-axis, 4px on y-axis
                          blurRadius: 8, // 8px blur radius
                          spreadRadius: 0, // 0px spread radius (optional)
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.of(context).push(
                            //   PageTransition(
                            //     child: Bottomnavigation(
                            //       initialIndex: 4, // Main index
                            //       initialSubIndex:
                            //           2, // Sub-index for MeScreen (SettingsScreen)
                            //     ),
                            //     type: PageTransitionType.leftToRight
                            //     duration: Duration(seconds: 1),
                            //   ),
                            // );
                          },
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    // Container(
                                    //   height: 40,
                                    //   width: 40,
                                    //   padding: EdgeInsets.all(10),
                                    //   child: Image.asset(
                                    //     'lib/assets/sup_liveChat.png',
                                    //     fit: BoxFit.contain,
                                    //   ),
                                    // ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 40,
                                            width: 40,
                                            padding: EdgeInsets.all(10),
                                            child: Image.asset(
                                              'lib/assets/sup_liveChat.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(),
                                            child: w600_17(context, 'Live Chat',
                                                blackColor),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(),
                                            child: w400_11_02_soft_wrap(
                                                'Fast Response', blackColor),
                                          ),
                                          // Container(
                                          //   margin: EdgeInsets.only(),
                                          //   child: w400_11_02_soft_wrap(
                                          //   'minute', blackColor),
                                          // ),
                                        ],
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
                  Container(
                    height: 150,
                    width: screenSize.width * 0.45,
                    // margin: EdgeInsets.only(top: screenSize.height * 0.01),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color:
                              Color(0x40C4C4C4), // #C4C4C440 with 25% opacity
                          offset: Offset(0, 4), // 0px on x-axis, 4px on y-axis
                          blurRadius: 8, // 8px blur radius
                          spreadRadius: 0, // 0px spread radius (optional)
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.of(context).push(
                            //   PageTransition(
                            //     child: Bottomnavigation(
                            //       initialIndex: 4, // Main index
                            //       initialSubIndex:
                            //           2, // Sub-index for MeScreen (SettingsScreen)
                            //     ),
                            //     type: PageTransitionType.leftToRight
                            //     duration: Duration(seconds: 1),
                            //   ),
                            // );
                          },
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    // Container(
                                    //   height: 40,
                                    //   width: 40,
                                    //   padding: EdgeInsets.all(10),
                                    //   child: Image.asset(
                                    //     'lib/assets/sup_email.png',
                                    //     fit: BoxFit.contain,
                                    //   ),
                                    // ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 40,
                                            width: 40,
                                            padding: EdgeInsets.all(10),
                                            child: Image.asset(
                                              'lib/assets/sup_email.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(),
                                            child: w600_17(
                                                context, 'Email', blackColor),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(),
                                            child: w400_11_02_soft_wrap(
                                                'Egofin@gmail.com', blackColor),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(),
                                            child: w400_12(
                                                context, '', blackColor),
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
                      ],
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

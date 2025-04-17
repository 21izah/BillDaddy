import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/data_constant.dart';

class AutosaveScreen extends StatefulWidget {
  const AutosaveScreen({super.key});

  @override
  State<AutosaveScreen> createState() => _AutosaveScreenState();
}

class _AutosaveScreenState extends State<AutosaveScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    void _showBottomDialog(BuildContext context) {
      final screenSize = MediaQuery.of(context).size;

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    width: screenSize.width, // Full width
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: Offset(0, -5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Title
                        w700_17(
                            context, 'AutoSave has been turned on', blackColor),

                        // Description
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              w400_14(
                                context,
                                'Money in your wallet has been transferred to your EgoFinance wallet.',
                                blackColor,
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Go to EgoVest Button
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  // context.go('/me/autosave02');
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  margin: EdgeInsets.only(
                                      right: 8), // Add spacing between buttons
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(4, 140, 252, 0.2),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: w500_14(
                                      context, 'Ego Wallet', secondaryColor),
                                ),
                              ),
                            ),
                            svgAsset(
                              'lib/assets/autoSaveArrowRight.svg',
                            ),

                            // Ok Button
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  // context.go('/savingSetting');
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  margin: EdgeInsets.only(
                                      left: 8), // Add spacing between buttons
                                  decoration: BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child:
                                      w500_14(context, 'EgoVest', whiteColor),
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 20),

                        // Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Go to EgoVest Button
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed('/autosave02');
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  margin: EdgeInsets.only(
                                      right: 8), // Add spacing between buttons
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(4, 140, 252, 0.2),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: w500_14(
                                      context, 'Go to EgoVest', secondaryColor),
                                ),
                              ),
                            ),

                            // Ok Button
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed('/savingSetting');
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  margin: EdgeInsets.only(
                                      left: 8), // Add spacing between buttons
                                  decoration: BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: w500_14(context, 'Ok', whiteColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: background02,
      appBar: AppBar(
        centerTitle: false,
        title: w700_24(
          context,
          'AutoSave',
          blackColor,
        ),
        backgroundColor: whiteColor,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: whiteColor,
            ),
          ),
          Positioned(
            top: screenSize.height * 0.23,
            left: screenSize.width * 0.1,
            child: Container(
              height: screenSize.height * 0.6,
              width: screenSize.width * 0.8,
              child: Image.asset(
                'lib/assets/saveBig.png',
                fit: BoxFit.contain, // Makes the image cover the area
              ),
            ),
          ),
          ListView(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                height: screenSize.height * 0.25,
                width: screenSize.width,
                color: secondaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text Column
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          w600_26(
                            context,
                            'Autosave and invest in EgoVest',
                            whiteColor,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20), // Add spacing between text and image
                    // Image Container
                    Container(
                      width: screenSize.width * 0.4,
                      height: screenSize.width * 0.4,
                      child: Image.asset(
                        'lib/assets/autoSaveAndInvest.png',
                        fit: BoxFit.contain, // Makes the image cover the area
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                    child: Container(
                      height: 138,
                      width: 138,
                      padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color.fromRGBO(4, 140, 252, 0.5),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 00.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Color.fromRGBO(4, 140, 252, 0.15),
                                    ),
                                    child: Transform.scale(
                                      scale: 0.7,
                                      child: Image.asset(
                                        'lib/assets/interestPaidDaily.png',
                                        fit: BoxFit
                                            .contain, // Makes the image cover the area
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: w400_14_02(
                                      context,
                                      'Interest paid',
                                      blackColor,
                                    ),
                                  ),
                                  w400_14_02(
                                    context,
                                    'daily',
                                    blackColor,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, left: 0, right: 20),
                    child: Container(
                      height: 138,
                      width: 138,
                      padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color.fromRGBO(4, 140, 252, 0.5),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 00.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Color.fromRGBO(4, 140, 252, 0.15),
                                    ),
                                    child: Transform.scale(
                                      scale: 0.7,
                                      child: Image.asset(
                                        'lib/assets/withdrawAnytime.png',
                                        fit: BoxFit
                                            .contain, // Makes the image cover the area
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: w400_14_02(
                                      context,
                                      'Withdraw',
                                      blackColor,
                                    ),
                                  ),
                                  w400_14_02(
                                    context,
                                    'anytime',
                                    blackColor,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  width: screenSize.width,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromRGBO(4, 140, 252, 0.5),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        // Icon Container
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Color.fromRGBO(4, 140, 252, 0.15),
                          ),
                          child: Transform.scale(
                            scale: 0.6,
                            child: Image.asset(
                              'lib/assets/safeLockFunds.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(
                            width: 20), // Add spacing between the icon and text
                        // Text Column
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              w700_18(
                                context,
                                'Safelock your funds',
                                blackColor,
                              ),
                              SizedBox(
                                  height:
                                      5), // Add spacing between title and subtitle
                              w400_14(
                                context,
                                'Get 10% interest per annum on your savings',
                                Color.fromRGBO(151, 151, 151, 1),
                              ),
                              SizedBox(
                                  height:
                                      5), // Add spacing between subtitle and CTA
                              w400_14(
                                context,
                                'Click Here >>>',
                                secondaryColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _showBottomDialog(context);
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    top: screenSize.height * 0.05,
                    left: screenSize.width * 0.05,
                    right: screenSize.width * 0.05,
                    bottom: screenSize.height * 0.02,
                  ),
                  child: Container(
                    height: screenSize.height * 0.05,
                    width: screenSize.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: secondaryColor,
                    ),
                    child: Center(
                      child: w500_17(context, 'Turn On', whiteColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

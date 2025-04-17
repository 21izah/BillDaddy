import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/data_constant.dart';
import 'trianglePainter.dart';

class SavingSettingScreen extends StatefulWidget {
  const SavingSettingScreen({super.key});

  @override
  State<SavingSettingScreen> createState() => _SavingSettingScreenState();
}

class _SavingSettingScreenState extends State<SavingSettingScreen> {
  bool isChecked = false;
  void openAuthomaticInvestmentBottomSheet() {
    showModalBottomSheet(
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      backgroundColor: whiteColor,
      context: context,
      builder: (context) {
        final screenSize = MediaQuery.of(context).size;
        return StatefulBuilder(
          // Use StatefulBuilder to manage the Checkbox state within the BottomSheet
          builder: (context, setState) {
            return Container(
              margin: EdgeInsets.all(20),
              // height: screenSize.height * 0.4,
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: textFieldBorderColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      w600_20(
                        context,
                        'Turn on Autosave',
                        blackColor,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        w400_14(
                          context,
                          'Turn on Autosave and start earning interest.',
                          Color.fromRGBO(151, 151, 151, 1),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/autosave');
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: screenSize.height * 0.12,
                        left: screenSize.width * 0.02,
                        right: screenSize.width * 0.02,
                        bottom: screenSize.height * 0.01,
                      ),
                      child: Container(
                        height: screenSize.height * 0.05,
                        width: screenSize.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
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
            );
          },
        );
      },
    );
  }

  void openInterestSetting() {
    showModalBottomSheet(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      context: context,
      builder: (context) {
        final screenSize = MediaQuery.of(context).size;
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              margin: EdgeInsets.all(20),
              height: screenSize.height * 0.2,
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.close,
                        color: blackColor,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      w600_20(
                        context,
                        'Interest Setting',
                        blackColor,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        w400_12(
                          context,
                          'Enable or disable interest on ',
                          Color.fromRGBO(151, 151, 151, 1),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Container(
                            height: 24,
                            width: 24,
                            child: Transform.scale(
                              // scaleX: 0.7,
                              // scaleY: 0.7,
                              scale:
                                  0.7, // Adjust the scale factor to control the size
                              child: SizedBox(
                                child: Switch.adaptive(
                                  activeColor: secondaryColor,
                                  value: isChecked,
                                  onChanged: (value) =>
                                      setState(() => isChecked = value),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      w400_12(
                        context,
                        'your savings',
                        Color.fromRGBO(151, 151, 151, 1),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

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
                    Get.offAllNamed('/me/settings');
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: w600_17(context, 'Settings', blackColor),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                w600_20(
                  context,
                  'Savings Settings',
                  blackColor,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: w400_14(
                    context,
                    'Manage your savings with the following options',
                    Color.fromRGBO(151, 151, 151, 1),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: GestureDetector(
                onTap: () {
                  openAuthomaticInvestmentBottomSheet();
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                    screenSize.width * 0.02,
                    screenSize.height * 0.03,
                    screenSize.width * 0.02,
                    screenSize.height * 0.03,
                  ),
                  width: screenSize.width,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromRGBO(4, 140, 252, 0.5),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: svgAsset(
                            'lib/assets/automatic_investment.svg',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              w700_17(
                                context,
                                'Authomatic investment',
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: GestureDetector(
                onTap: () {
                  openInterestSetting();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenSize.width * 0.02,
                    vertical: screenSize.height * 0.03,
                  ),
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
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: svgAsset(
                            'lib/assets/interest_setting.svg',
                          ),
                        ),
                        SizedBox(
                            width: 20), // Add spacing between the icon and text
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              w700_17(
                                context,
                                'Interest Setting',
                                blackColor,
                              ),
                              SizedBox(
                                  height:
                                      5), // Add spacing between the title and subtitle
                              w400_14(
                                context,
                                'Enable or disable interest on your savings',
                                Color.fromRGBO(151, 151, 151, 1),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed('/safeLock');
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                    screenSize.width * 0.02,
                    0,
                    0,
                    screenSize.height * 0.03,
                  ),
                  width: screenSize.width,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromRGBO(4, 140, 252, 0.5),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  alignment: Alignment.centerRight,
                                  width: 70,
                                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  decoration: BoxDecoration(
                                      color: secondaryColor,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(05))),
                                  child: w400_14(
                                    context,
                                    'NEW',
                                    whiteColor,
                                  ),
                                ),
                                Positioned(
                                  right: 50,
                                  child: CustomPaint(
                                    size: Size(
                                        36, 36), // Set the size of the canvas
                                    painter: TrianglePainter(whiteColor),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: svgAsset(
                                'lib/assets/safe_lock.svg',
                              ),
                            ),
                            SizedBox(
                                width:
                                    20), // Add spacing between the icon and text
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  w700_17(
                                    context,
                                    'Safe Lock',
                                    blackColor,
                                  ),
                                  SizedBox(
                                      height:
                                          5), // Add spacing between the title and subtitle
                                  w400_14(
                                    context,
                                    'Get 10% interest per annum on your savings',
                                    Color.fromRGBO(151, 151, 151, 1),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

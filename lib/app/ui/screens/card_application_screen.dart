import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:page_transition/page_transition.dart';

import '../../utils/constants/data_constant.dart';
import 'card_successful_screen.dart';

class CardApplicationScreen extends StatefulWidget {
  const CardApplicationScreen({super.key});

  @override
  State<CardApplicationScreen> createState() => _CardApplicationScreenState();
}

class _CardApplicationScreenState extends State<CardApplicationScreen> {
  List<bool> isCheckedList01 = [
    false,
  ];
  void openBottomSheet() {
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
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          // This ensures the text wraps properly
                          child: RichText(
                            textAlign:
                                TextAlign.center, // Center-aligns the text
                            text: TextSpan(
                              style: w400_12_s(context, blackColor),
                              children: [
                                TextSpan(
                                  text: 'You are about to pay',
                                  style: w400_12_s(
                                    context,
                                    blackColor,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ₦200.00 ',
                                  style: w400_12_s(
                                    context,
                                    secondaryColor,
                                  ),
                                ),
                                TextSpan(
                                  text: ' with your balance for your order',
                                  style: w400_12_s(
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
                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(
                      top: screenSize.height * 0.01,
                      bottom: screenSize.height * 0.01,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(217, 217, 217, 0.25),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              w400_14(context, 'Amount', blackColor),
                              w500_14(context, '₦ 200.00', blackColor),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              w400_14(context, 'Fee', blackColor),
                              w500_14(context, '₦ 0.00', blackColor),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              w400_14(context, 'Total amount', blackColor),
                              w500_14(context, '₦ 300.00', blackColor),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(
                      top: screenSize.height * 0.01,
                      bottom: screenSize.height * 0.01,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(217, 217, 217, 0.25),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            svgAsset(
                              'lib/assets/ca_wallet.svg',
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: w400_14(context,
                                  'Balance (₦ 31,534,000.00)', blackColor),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(10),
                    dashPattern: [6, 3], // Length of the dash and gap
                    color: blackColor, // Border color
                    strokeWidth: 1, // Thickness of the dotted line
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(
                        top: screenSize.height * 0.01,
                        bottom: screenSize.height * 0.01,
                      ),
                      decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(10),

                          ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              svgAsset(
                                'lib/assets/ca_pluss.svg',
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: w400_14(context,
                                    'Add new payment option', blackColor),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        PageTransition(
                            child: CardSuccessfulScreen(),
                            type: PageTransitionType.leftToRight
                            // duration: Duration(seconds: 1),
                            ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: screenSize.height * 0.02),
                      alignment: Alignment.center,
                      height: 45,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: w500_14(context, 'Payment ₦200', whiteColor),
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

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background02,
      appBar: AppBar(
        // centerTitle: false,
        // title: w600_17(
        //   context,
        //   'Card Application',
        //   blackColor,
        // ),
        backgroundColor: whiteColor,
        leadingWidth: 300,
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
                    Get.offAllNamed('/cards');
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: w600_17(context, 'Card Application', blackColor),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        w500_20(context, 'Personal Information', blackColor),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          w400_14(context, 'First Name', blackColor),
                          w400_14(context, 'WALIYILAHI', blackColor),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          w400_14(context, 'Middle Name', blackColor),
                          w400_14(context, 'ADEYANJU', blackColor),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          w400_14(context, 'Last Name', blackColor),
                          w400_14(context, 'BAKARE', blackColor),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          w400_14(context, 'Date of Birth', blackColor),
                          w400_14(context, '17/01/2020', blackColor),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          w400_14(context, 'Gender', blackColor),
                          w400_14(context, 'Male', blackColor),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
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
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, top: 10, bottom: 10),
                      child: Row(
                        children: [
                          w500_20(context, 'Account Details', blackColor),
                        ],
                      ),
                    ),
                    StatefulBuilder(
                      // Use StatefulBuilder to manage the Checkbox state within the BottomSheet
                      builder: (context, setState) {
                        return Container(
                          margin: EdgeInsets.all(0),
                          width: double.infinity,
                          child: Column(
                            children: [
                              // Container 1 - Naira
                              GestureDetector(
                                onTap: () {
                                  // Update only the tapped container and reset the others
                                  setState(() {
                                    for (int i = 0;
                                        i < isCheckedList01.length;
                                        i++) {
                                      isCheckedList01[i] = (i ==
                                          0); // Only index 0 (first container) is true
                                    }
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: isCheckedList01[0]
                                        ? textfieldColor
                                        : Colors.transparent,
                                  ),
                                  margin: EdgeInsets.only(top: 10),
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      child: w400_14(
                                                          context,
                                                          'Balance Account',
                                                          blackColor),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Transform.scale(
                                        scale: 1.2,
                                        child: Container(
                                          child: Checkbox.adaptive(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20), // Circular shape
                                            ),
                                            value: isCheckedList01[0],
                                            onChanged: (value) {
                                              setState(() {
                                                for (int i = 0;
                                                    i < isCheckedList01.length;
                                                    i++) {
                                                  isCheckedList01[i] = (i ==
                                                      0); // Only first checkbox gets checked
                                                }
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        w500_20(
                            context, 'Transaction Limit (Tier 2)', blackColor),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(4, 140, 252, 0.11),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: w400_14(context, 'Customize the limit',
                                  secondaryColor)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          w400_14(
                              context, 'Daily Transaction Limit', blackColor),
                          w500_17(context, '₦ 200,000.00', blackColor),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        w500_20(context, 'FEE and Charges', blackColor),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          w400_14(context, 'Issuance Fee', blackColor),
                          w500_17(context, '₦ 200.00', blackColor),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          w400_14(context, 'Maintenance Fee', blackColor),
                          w400_14(context, 'FREE', blackColor),
                        ],
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
                  margin: EdgeInsets.only(top: screenSize.height * 0.02),
                  alignment: Alignment.center,
                  height: 45,
                  width: screenSize.width * 0.85,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: w500_14(context, 'Confirm and Pay', whiteColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

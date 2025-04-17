import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';

import '../../utils/constants/data_constant.dart';
import 'giftcard_verifying_screen.dart';

class GiftcardScreen03 extends StatefulWidget {
  final String imagePath01;
  final String name;
  const GiftcardScreen03(
      {super.key, required this.imagePath01, required this.name});

  @override
  State<GiftcardScreen03> createState() => _GiftcardScreen03State();
}

class _GiftcardScreen03State extends State<GiftcardScreen03> {
  void _showBottomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final screenSize = MediaQuery.of(context).size;
        return Align(
          alignment: Alignment.bottomCenter, // Align at the bottom
          child: Padding(
            padding: const EdgeInsets.all(0.0), // Optional padding
            child: Material(
              color: Colors.transparent, // Make the background transparent
              child: Container(
                margin:
                    EdgeInsets.fromLTRB(10, 0, 10, screenSize.height * 0.02),
                width: MediaQuery.of(context).size.width, // Full width
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20), // Rounded corners
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
                  mainAxisSize:
                      MainAxisSize.min, // Take up minimum vertical space
                  children: [
                    w700_16(context, 'Biometric authentication required',
                        blackColor),
                    SizedBox(height: screenSize.height * 0.01),
                    w400_14_02(
                      context,
                      'Verify Identity',
                      Color.fromRGBO(143, 154, 160, 1),
                    ),
                    SizedBox(height: screenSize.height * 0.02),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          PageTransition(
                            child: GiftcardVerifyingScreen(),
                            type: PageTransitionType.leftToRight,
                            // duration: Duration(seconds: 1),
                          ),
                        );
                      },
                      child: Container(
                        // color: secondaryColor,
                        height: screenSize.height * 0.06,
                        width: screenSize.width * 0.2,
                        child: svgAsset(
                          'lib/assets/fingerPrint.svg',
                        ),
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.01),
                    w400_14_02(
                      context,
                      'Scan Fingerprint to authenticate',
                      Color.fromRGBO(143, 154, 160, 1),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: w400_14(
                        context,
                        'Cancel',
                        blackColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void openGiftcardDetailsSheet() {
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
                  Container(
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
                        Padding(
                          padding: EdgeInsets.only(
                              top: screenSize.height * 0.03,
                              bottom: screenSize.height * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: w500_24_r(
                                  context,
                                  '₦ 31,000,000,000.00',
                                  blackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            w400_14(context, 'Gift Card', blackColor),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: w500_14(
                                        context, widget.name, blackColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            w400_14(context, 'Price / Unit', blackColor),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0.0),
                                    child: w500_14(
                                        context, '\$2 / unit', blackColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            w400_14(context, 'Amount', blackColor),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: svgAssetCo(
                                      'lib/assets/ngnnaira.svg',
                                      ColorFilter.mode(
                                          blackColor, BlendMode.srcIn),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2.0),
                                    child: w500_14(context, '31,000,000,000.00',
                                        blackColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            w400_14(context, 'Quantity', blackColor),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0.0),
                                    child: w500_14(
                                        context, '5 - cards', blackColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    // todo
                    padding: const EdgeInsets.only(top: 30.0, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        w400_14(context, 'Payment method', blackColor),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(217, 217, 217, 0.25),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                padding: EdgeInsets.all(10),
                                child: svgAsset(
                                  'lib/assets/card23.svg',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(),
                                          child: w400_14(
                                              context, 'Balance ', blackColor),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(),
                                          child: w400_14(context,
                                              '(₦ 31,345,00.00)', blackColor),
                                        ),
                                      ],
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
                      _showBottomDialog(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        top: screenSize.height * 0.03,
                        bottom: screenSize.height * 0.025,
                      ),
                      alignment: Alignment.center,
                      height: 40,
                      width: screenSize.width,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: w500_17(context, 'Pay', whiteColor)),
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
      backgroundColor: whiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: w700_24(
          context,
          'Buy Giftcard',
          blackColor,
        ),
        backgroundColor: whiteColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
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
                  color: textfieldColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.only(top: 20, bottom: 20),
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset(
                              '${widget.imagePath01}',
                              fit: BoxFit.scaleDown,
                            ),
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
                                    context, '${widget.name}', blackColor),
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
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: w500_12(
                context,
                'Provide all information required',
                blackColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 5),
              child: w500_12(
                context,
                'Amount',
                blackColor,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: textfieldColor,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.only(top: 10, bottom: 20),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(),
                                child: w500_12(context, '\$2', blackColor)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: textfieldColor,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.only(top: 10, bottom: 20),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(),
                              child: w500_12(
                                  context, 'Select Quantity', blackColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // margin: EdgeInsets.only(bottom: 5),
                              height: 30,
                              width: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                // color: Colors.pink,
                              ),
                              child: Center(
                                child: w600_18(
                                  context,
                                  '-',
                                  blackColor,
                                ),
                              ),
                            ),
                            Container(
                              // margin: EdgeInsets.only(bottom: 5),
                              height: 30,
                              width: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                // color: Colors.pink,
                              ),
                              child: Center(
                                child: w600_18(
                                  context,
                                  '1',
                                  blackColor,
                                ),
                              ),
                            ),
                            Container(
                              // margin: EdgeInsets.only(bottom: 5),
                              height: 30,
                              width: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                // color: Colors.pink,
                              ),
                              child: Center(
                                child: w600_18(
                                  context,
                                  '+',
                                  blackColor,
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
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(4, 140, 225, 0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.only(top: 10, bottom: 20),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                padding: EdgeInsets.fromLTRB(5, 10, 10, 10),
                                margin: EdgeInsets.only(),
                                child: w500_12(
                                    context, '₦ 2,935.80', primaryColor)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                w400_12(context, 'Balance: ', blackColor),
                w400_12(context, '****', blackColor),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(4, 140, 225, 0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      w400_12(context, 'Rate: ', blackColor),
                      w400_12(context, '\$10', blackColor),
                    ],
                  ),
                ),
              ],
            ),
            _buildSignInButton(screenSize),
          ],
        ),
      ),
    );
  }

  Widget _buildSignInButton(Size screenSize) {
    return GestureDetector(
      onTap: () {
        openGiftcardDetailsSheet();
      },
      child: Padding(
        padding: EdgeInsets.only(
          top: screenSize.height * 0.15,
          left: screenSize.width * 0.02,
          right: screenSize.width * 0.02,
          bottom: screenSize.height * 0.02,
        ),
        child: Container(
          height: screenSize.height * 0.06,
          width: screenSize.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: secondaryColor,
          ),
          child: Center(
            child: w500_17(context, 'Confirm', whiteColor),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../utils/constants/data_constant.dart';
import 'transfer_to_egoFinace-success_screen.dart';

class TransferToEgofinaceScreenReceipt extends StatefulWidget {
  const TransferToEgofinaceScreenReceipt({super.key});

  @override
  State<TransferToEgofinaceScreenReceipt> createState() =>
      _TransferToEgofinaceScreenReceiptState();
}

class _TransferToEgofinaceScreenReceiptState
    extends State<TransferToEgofinaceScreenReceipt> {
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
                              child: TransferToEgoFinaceSuccessScreen(),
                              type: PageTransitionType.leftToRight
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

  // void _showBottomDialog(BuildContext context) {
  //   final screenSize = MediaQuery.of(context).size;
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Align(
  //         alignment: Alignment.bottomCenter, // Align at the bottom
  //         child: Padding(
  //           padding: const EdgeInsets.all(8.0), // Optional padding
  //           child: Material(
  //             color: Colors.transparent, // Make the background transparent
  //             child: Container(
  //               height: screenSize.height * 0.3,
  //               width: MediaQuery.of(context).size.width, // Full width
  //               padding: EdgeInsets.all(20),
  //               decoration: BoxDecoration(
  //                 color: Colors.white,
  //                 borderRadius: BorderRadius.circular(20), // Rounded corners
  //                 boxShadow: [
  //                   BoxShadow(
  //                     color: Colors.black.withOpacity(0.2),
  //                     blurRadius: 10,
  //                     offset: Offset(0, -5),
  //                   ),
  //                 ],
  //               ),
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 mainAxisSize:
  //                     MainAxisSize.min, // Take up minimum vertical space
  //                 children: [
  //                   w700_17(context, 'Biometric authentication required',
  //                       blackColor),
  //                   SizedBox(height: 10),
  //                   w700_17(
  //                     context,
  //                     'Verify Identity',
  //                     Color.fromRGBO(143, 154, 160, 1),
  //                   ),
  //                   SizedBox(height: 20),
  //                   GestureDetector(
  //                     onTap: () {
  //                       Navigator.of(context).push(
  //                         PageTransition(
  //                             child: TransferToEgoFinaceSuccessScreen(),
  //                             type: PageTransitionType.leftToRight
  //                             duration: Duration(seconds: 1)),
  //                       );
  //                     },
  //                     child: Container(
  //                       height: 50,
  //                       width: 50,
  //                       child: svgAsset(
  //                         'lib/assets/fingerPrint.svg',
  //                       ),
  //                     ),
  //                   ),
  //                   SizedBox(height: 10),
  //                   w700_17(
  //                     context,
  //                     'Scan Fingerprint to authenticate',
  //                     Color.fromRGBO(143, 154, 160, 1),
  //                   ),
  //                   TextButton(
  //                     onPressed: () {
  //                       Navigator.of(context).pop(); // Close the dialog
  //                     },
  //                     child: w400_14(
  //                       context,
  //                       'Cancel',
  //                       blackColor,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background02,
      appBar: AppBar(
        title: w600_20(context, 'Transaction Details', blackColor),
        centerTitle: false,
      ),
      body: ListView(
        children: [
          Container(
            color: whiteColor,
            margin: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          margin: EdgeInsets.only(left: 20, top: 30),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(4, 140, 252, 1),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 10,
                                offset: Offset(0, -5),
                              ),
                            ],
                          ),
                          child: svgAsset(
                            'lib/assets/card-sendcard.svg',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8, top: 30),
                          child: w400_16(context, 'Money Sent',
                              Color.fromRGBO(51, 51, 51, 0.7)),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0, top: 30),
                          child: w400_16(context, '- ₦ 12,000.00', blackColor),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 1.0,
                        color: textFieldBorderColor,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          border: Border.all(
                            color: Color.fromRGBO(51, 51, 51, 0.7),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min, // Wrap content
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: Color.fromRGBO(51, 51, 51, 0.7),
                              size: 15,
                            ),
                            SizedBox(width: 5),
                            w400_14(context, 'Jan 23rd, 12:09',
                                Color.fromRGBO(51, 51, 51, 0.7)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 10, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      w400_14(
                          context, 'Status', Color.fromRGBO(51, 51, 51, 0.7)),
                      w400_14(context, 'ONGOING', blackColor),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 10, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      w400_14(
                          context, 'Sender', Color.fromRGBO(51, 51, 51, 0.7)),
                      w400_14(context, 'BOLA RAHMOT BADMUS', blackColor),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 10, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      w400_14(context, 'Sender Account',
                          Color.fromRGBO(51, 51, 51, 0.7)),
                      w400_14(context, '907 467 5689', blackColor),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 10, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      w400_14(context, 'Recipient Account',
                          Color.fromRGBO(51, 51, 51, 0.7)),
                      w400_14(context, '818 278 6899', blackColor),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 10, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      w400_14(context, 'Paid with',
                          Color.fromRGBO(51, 51, 51, 0.7)),
                      w400_14(context, 'BalancePayment', blackColor),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 10, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      w400_14(
                          context, 'Remark', Color.fromRGBO(51, 51, 51, 0.7)),
                      w400_14(context, 'mn', blackColor),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 10, left: 20, right: 20),
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 20, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      w400_14(context, 'Transaction number',
                          Color.fromRGBO(51, 51, 51, 0.7)),
                      w400_14(context, '632632632676326326', blackColor),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 20, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      w400_14(
                          context, 'Category', Color.fromRGBO(51, 51, 51, 0.7)),
                      w400_14(context, 'Transfer', blackColor),
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              _showBottomDialog(context);
            },
            child: Container(
              margin: EdgeInsets.only(
                top: screenSize.height * 0.03,
                bottom: 10,
                left: 20,
                right: 20,
              ),
              alignment: Alignment.center,
              height: 40,
              width: screenSize.width,
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: w500_14(context, 'Pay', whiteColor),
            ),
          ),
        ],
      ),
    );
  }
}

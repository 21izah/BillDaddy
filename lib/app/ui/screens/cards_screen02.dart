import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../utils/constants/data_constant.dart';
import 'fund_usd_screen.dart';
import 'withdrawCard_successful_screen.dart';

class CardsScreen02 extends StatefulWidget {
  const CardsScreen02({super.key});

  @override
  State<CardsScreen02> createState() => _CardsScreen02State();
}

class _CardsScreen02State extends State<CardsScreen02> {
  List<Map<String, dynamic>> allTransactions = [
    {
      'date': 'Wed, 12:10 AM',
      'transaction_type': 'Withdrawal',
      'amount': '₦2,000.00',
      'iamgePath': 'lib/assets/uil_money-withdraw.svg',
    },
    {
      'date': 'Mon, 11:00AM',
      'transaction_type': 'Credit',
      'amount': '₦4,000.00',
      'iamgePath': 'lib/assets/card-sendcard.svg',
    },
    {
      'date': 'Mon, 11:00AM',
      'transaction_type': 'Credit',
      'amount': '₦24,000.00',
      'iamgePath': 'lib/assets/card-sendcard.svg',
    },
    {
      'date': 'Sat, 11:00AM',
      'transaction_type': 'Withdrawal',
      'amount': '₦2,000.00',
      'iamgePath': 'lib/assets/uil_money-withdraw.svg',
    },
    {
      'date': 'Sat, 11:00AM',
      'transaction_type': 'Withdrawal',
      'amount': '₦2,000.00',
      'iamgePath': 'lib/assets/uil_money-withdraw.svg',
    },
  ];
  final _amountController = TextEditingController();
  @override
  void dispose() {
    _amountController.dispose();

    super.dispose();
  }

  void openshowDetailsBottomSheet() {
    showModalBottomSheet(
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: w700_20(context, 'Card Details', blackColor),
                      ),
                      Container(
                        height: 40,
                        child: svgAsset(
                          'lib/assets/close_icon.svg',
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            w400_14(context, 'Card Number', blackColor),
                            Container(
                              // padding: EdgeInsets.all(8),
                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(5),
                              // ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0.0),
                                    child: w400_14(context,
                                        '4274 8976 5430 2244', blackColor),
                                  ),
                                  Container(
                                    height: 20,
                                    width: 20,
                                    margin: EdgeInsets.only(left: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Transform.scale(
                                      scale: 0.5,
                                      child: Icon(
                                        Icons.copy,
                                        color: secondaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            w400_14(context, 'Valid Until', blackColor),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child:
                                        w400_14(context, '06/25', blackColor),
                                  ),
                                  Container(
                                    height: 20,
                                    width: 20,
                                    margin: EdgeInsets.only(left: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Transform.scale(
                                      scale: 0.5,
                                      child: Icon(
                                        Icons.copy,
                                        color: secondaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            w400_14(context, 'CVC', blackColor),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: w400_14(context, '126', blackColor),
                                  ),
                                  Container(
                                    height: 20,
                                    width: 20,
                                    margin: EdgeInsets.only(left: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Transform.scale(
                                      scale: 0.5,
                                      child: Icon(
                                        Icons.copy,
                                        color: secondaryColor,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        w400_14(context, 'Back', blackColor),
                      ],
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

  void openDelete() {
    showModalBottomSheet(
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: w700_20(context, 'Card Details', blackColor),
                      ),
                      Container(
                        height: 40,
                        child: svgAsset(
                          'lib/assets/close_icon.svg',
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    padding: EdgeInsets.all(8),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            w400_14(context, 'Card Number', blackColor),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0.0),
                                    child: w400_14(context,
                                        '4274 8976 5430 2244', blackColor),
                                  ),
                                  Container(
                                    height: 20,
                                    width: 20,
                                    margin: EdgeInsets.only(left: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Transform.scale(
                                      scale: 0.5,
                                      child: Icon(
                                        Icons.copy,
                                        color: secondaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            w400_14(context, 'Valid Until', blackColor),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child:
                                        w400_14(context, '06/25', blackColor),
                                  ),
                                  Container(
                                    height: 20,
                                    width: 20,
                                    margin: EdgeInsets.only(left: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Transform.scale(
                                      scale: 0.5,
                                      child: Icon(
                                        Icons.copy,
                                        color: secondaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            w400_14(context, 'CVC', blackColor),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: w400_14(context, '126', blackColor),
                                  ),
                                  Container(
                                    height: 20,
                                    width: 20,
                                    margin: EdgeInsets.only(left: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Transform.scale(
                                      scale: 0.5,
                                      child: Icon(
                                        Icons.copy,
                                        color: secondaryColor,
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
                  GestureDetector(
                    onTap: null,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: screenSize.height * 0.01,
                        left: screenSize.width * 0.02,
                        right: screenSize.width * 0.02,
                        bottom: screenSize.height * 0.02,
                      ),
                      child: Container(
                        height: screenSize.height * 0.06,
                        width: screenSize.width,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color.fromRGBO(248, 71, 11, 1)),
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                        ),
                        child: Center(
                          child: w500_17(context, 'Delete Card',
                              Color.fromRGBO(248, 71, 11, 1)),
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

  void openBalanceBottomSheet() {
    showModalBottomSheet(
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: w700_20(context, 'Card Balance', blackColor),
                      ),
                      Container(
                        height: 40,
                        child: svgAsset(
                          'lib/assets/close_icon.svg',
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
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
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(5, 71, 138, 0.08),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              w400_14(context, 'Balance', blackColor),
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromRGBO(5, 71, 138, 1),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: w500_14(
                                            context, '₦2000', whiteColor),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 0.0),
                                        child:
                                            w500_10(context, '.00', whiteColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        w400_14(context, 'Back', blackColor),
                      ],
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

  void openWithdraw() {
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child:
                            w700_20(context, 'Withdraw to wallet', blackColor),
                      ),
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
                    // padding: const EdgeInsets.all(1.0),
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: TextFormField(
                      style: TextStyle(
                        color: blackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                      cursorColor: secondaryColor,
                      keyboardType: TextInputType.number,
                      controller: _amountController,
                      validator: (value) =>
                          value!.isEmpty ? 'Amount is required' : null,
                      decoration: InputDecoration(
                        // contentPadding: EdgeInsets.only(
                        //   left: 15,
                        //   top: 20,
                        //   right: 10,
                        //   bottom: 20,
                        // ),
                        label: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Type in amount here'),
                          ],
                        ),

                        labelStyle: buttonText04Style(cardRadialColor01),
                        floatingLabelBehavior: FloatingLabelBehavior.never,

                        filled: false,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: textFieldBorderColor),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: textFieldBorderColor),
                          borderRadius: BorderRadius.circular(5),
                        ),

                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: textFieldBorderColor),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      w400_14(context, 'Available balance', secondaryColor),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: w500_14(context, '₦2000', blackColor),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 0.0),
                                child: w500_10(context, '.00', blackColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  _buildSignInButton(screenSize),
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenSize.height * 0.005,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        w400_14(context, 'Back', blackColor),
                      ],
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
                              child: WithdrawcardSuccessfulScreen(),
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

  Widget _buildSignInButton(Size screenSize) {
    return GestureDetector(
      onTap: () {
        _showBottomDialog(context);
      },
      child: Padding(
        padding: EdgeInsets.only(
          top: screenSize.height * 0.005,
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
            child: w500_17(context, 'Continue', whiteColor),
          ),
        ),
      ),
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
              padding: EdgeInsets.all(screenSize.height * 0.02),

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
                            margin:
                                EdgeInsets.only(top: screenSize.height * 0.01),
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
                        margin: EdgeInsets.only(top: screenSize.height * 0.03),
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
                          margin:
                              EdgeInsets.only(top: screenSize.height * 0.02),
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
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      openshowDetailsBottomSheet();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: screenSize.width * 0.4,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: w500_14(context, 'Show Details', whiteColor),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      openBalanceBottomSheet();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 10),
                      height: 40,
                      width: screenSize.width * 0.4,
                      decoration: BoxDecoration(
                        border: Border.all(color: blackColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: w500_14(context, 'Check Balance', blackColor),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Container(
                width: screenSize.width,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: textFieldBorderColor),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x40C4C4C4), // #C4C4C440 with 25% opacity
                      offset: Offset(0, 4), // 0px on x-axis, 4px on y-axis
                      blurRadius: 8, // 8px blur radius
                      spreadRadius: 0, // 0px spread radius (optional)
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 10, bottom: 20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            PageTransition(
                                child: FundUsdScreen(),
                                type: PageTransitionType.leftToRight
                                // duration: Duration(seconds: 1),
                                ),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              height: 30,
                              width: 30,
                              margin: EdgeInsets.only(top: 5),
                              decoration: BoxDecoration(
                                border: Border.all(color: secondaryColor),
                                borderRadius: BorderRadius.circular(5),
                                color: whiteColor,
                              ),
                              child: svgAsset(
                                'lib/assets/addMoney.svg',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: w500_14(
                                context,
                                'Fund Card',
                                blackColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 10, bottom: 20),
                      child: GestureDetector(
                        onTap: () {
                          openWithdraw();
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              height: 30,
                              width: 30,
                              margin: EdgeInsets.only(top: 5),
                              decoration: BoxDecoration(
                                border: Border.all(color: secondaryColor),
                                borderRadius: BorderRadius.circular(5),
                                color: whiteColor,
                              ),
                              child: svgAsset(
                                'lib/assets/transfer.svg',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: w500_14(
                                context,
                                'Withdraw',
                                blackColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 20.0, top: 10, bottom: 20),
                      child: GestureDetector(
                        onTap: () {
                          openDelete();
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(7),
                              height: 30,
                              width: 30,
                              margin: EdgeInsets.only(top: 5),
                              decoration: BoxDecoration(
                                border: Border.all(color: secondaryColor),
                                borderRadius: BorderRadius.circular(5),
                                color: whiteColor,
                              ),
                              child: svgAsset(
                                'lib/assets/withdraw.svg',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: w500_14(
                                context,
                                'Delete Card',
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: w500_14(
                      context,
                      'Transfer',
                      blackColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: w500_14(
                        context,
                        'View all',
                        secondaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                height: screenSize.height * 0.3,
                child: ListView.builder(
                  itemCount: allTransactions.length,
                  itemBuilder: (context, index) {
                    final transactionD = allTransactions[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 10, top: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 16,
                                    backgroundColor: colrs,
                                    child: svgAsset(transactionD['iamgePath']),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: w500_12(
                                      context,
                                      transactionD['transaction_type'],
                                      textColorSecondary,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 2.0),
                                    child: transactionD['transaction_type'] ==
                                            'Withdrawal'
                                        ? w500_14(
                                            context,
                                            '-',
                                            Color.fromRGBO(235, 4, 31, 1),
                                          )
                                        : transactionD['transaction_type'] ==
                                                'Credit'
                                            ? w500_14(
                                                context,
                                                '+',
                                                secondaryColor,
                                              )
                                            : Container(), // Display an empty container if none matches
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 1.0),
                                    child: w500_14(
                                      context,
                                      transactionD['amount'],
                                      blackColor,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 0.0),
                                    child: w500_10(
                                      context,
                                      '.00',
                                      textColorSecondary,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      w500_08(
                                        context,
                                        'Today',
                                        primaryColor,
                                      ),
                                      w400_08(
                                        context,
                                        transactionD['date'],
                                        textColorSecondary,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          Divider(
                            color: textFieldBorderColor,
                            thickness: 1,
                          ),
                        ],
                      ),
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}

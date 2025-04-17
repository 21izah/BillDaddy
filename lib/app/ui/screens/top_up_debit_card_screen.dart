import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../../utils/constants/data_constant.dart';
import 'top_up_D_successful_screen.dart';

class TopUpDebitCardScreen extends StatefulWidget {
  final String bankAccountDetails01;
  final String bankImage;
  const TopUpDebitCardScreen(
      {super.key, required this.bankAccountDetails01, required this.bankImage});

  @override
  State<TopUpDebitCardScreen> createState() => _TopUpDebitCardScreenState();
}

class _TopUpDebitCardScreenState extends State<TopUpDebitCardScreen> {
  final _amountController = TextEditingController();
  @override
  void dispose() {
    _amountController.dispose();

    super.dispose();
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
                              child: TopUpDSuccessfulScreen(),
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
  //                             child: TopUpDSuccessfulScreen(),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      w600_17(
                        context,
                        'Amount',
                        Color.fromRGBO(51, 51, 51, 1),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(Icons.close)),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(1.0),
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'email is required';
                        }
                        return null;
                      },
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(51, 51, 51, 1),
                          fontSize: 25),
                      cursorColor: secondaryColor,
                      keyboardType: TextInputType.number,
                      controller: _amountController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          left: 10,
                          top: 20,
                          right: 10,
                          bottom: 10,
                        ),
                        labelStyle: GoogleFonts.quicksand(color: Colors.black),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Enter Amount',
                        hintStyle: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(51, 51, 51, 0.4),
                            fontSize: 13),
                        filled: true,
                        fillColor: Colors.white,
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
                  GestureDetector(
                    onTap: () {
                      _showBottomDialog(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: screenSize.height * 0.05,
                        bottom: screenSize.height * 0.02,
                        // left: screenSize.width * 0.04,
                        // right: screenSize.width * 0.04,
                      ),
                      child: Container(
                        height: screenSize.height * 0.05,
                        width: screenSize.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(4, 140, 252, 1),
                        ),
                        child: Center(
                          child: w500_17(context, 'Continue',
                              Color.fromRGBO(255, 255, 255, 1)),
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

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          centerTitle: false,
          title: w600_17(
            context,
            'Top-up With Card / Account',
            blackColor,
          ),
          backgroundColor: whiteColor,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0, top: 30.0, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    w400_16(
                      context,
                      'Transfer From',
                      blackColor,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(left: 0, right: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(5, 71, 138, 0.2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Image.asset('${widget.bankImage}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            w500_17(
                              context,
                              'Bola Raymond',
                              blackColor,
                            ),
                            w400_17(
                              context,
                              widget.bankAccountDetails01,
                              blackColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  openBottomSheet();
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    top: screenSize.height * 0.15,
                    bottom: screenSize.height * 0.02,
                    left: screenSize.width * 0.04,
                    right: screenSize.width * 0.04,
                  ),
                  child: Container(
                    height: screenSize.height * 0.05,
                    width: screenSize.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(4, 140, 252, 1),
                    ),
                    child: Center(
                      child: w500_17(context, 'Add Money',
                          Color.fromRGBO(255, 255, 255, 1)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

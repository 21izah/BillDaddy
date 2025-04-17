import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants/data_constant.dart';

class PaymentVerifyNumberScreen extends StatefulWidget {
  const PaymentVerifyNumberScreen({super.key});

  @override
  State<PaymentVerifyNumberScreen> createState() =>
      _PaymentVerifyNumberScreenState();
}

class _PaymentVerifyNumberScreenState extends State<PaymentVerifyNumberScreen> {
  final _firstPinController = TextEditingController();

  final _secondPinController = TextEditingController();

  final _thirdPinController = TextEditingController();

  final _fourthPinController = TextEditingController();
  final _fifthPinController = TextEditingController();

  final _sixthPinController = TextEditingController();
  @override
  void dispose() {
    _firstPinController.dispose();
    _secondPinController.dispose();
    _thirdPinController.dispose();
    _fourthPinController.dispose();
    _fifthPinController.dispose();
    _sixthPinController.dispose();
    super.dispose();
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
                    Get.offAllNamed('/verifyPaymentPin');
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: w600_17(context, 'Verify Phone Number', blackColor),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  w600_20(context, 'Enter Password', blackColor),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    // This ensures the text wraps properly
                    child: RichText(
                      textAlign: TextAlign.center, // Center-aligns the text
                      text: TextSpan(
                        style: w400_12_s(context, blackColor),
                        children: [
                          TextSpan(
                            text:
                                'A verification code has been sent to your phone number',
                            style: w400_17_s(
                              context,
                              Color.fromRGBO(51, 51, 51, 0.71),
                            ),
                          ),
                          TextSpan(
                            text: ' 907****400',
                            style: w700_17_s(
                              context,
                              Color.fromRGBO(51, 51, 51, 0.71),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            content(),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      w400_16(
                        context,
                        "Didn't receive code? ",
                        Color.fromRGBO(
                          51,
                          51,
                          51,
                          0.2,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      w400_16(context, 'Resend', secondaryColor),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed('/paymentVerifyBvn');
              },
              child: Padding(
                padding: EdgeInsets.only(
                  top: screenSize.height * 0.2,
                  left: 20,
                  right: 20,
                  bottom: screenSize.height * 0.02,
                ),
                child: Container(
                  height: screenSize.height * 0.06,
                  width: screenSize.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: secondaryColor),
                  child: Center(child: w500_17(context, 'Verify', whiteColor)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget content() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15,
        bottom: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // First TextFormField
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              height: 60,
              child: TextFormField(
                controller: _firstPinController,
                cursorColor: secondaryColor,
                onChanged: (value) {
                  if (value.length == 1 &&
                      _firstPinController.text.isNotEmpty) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: textFieldBorderColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  filled: true,
                  fillColor: textfieldColor,
                  focusColor: textfieldColor,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: textFieldBorderColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: textFieldBorderColor),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                style: GoogleFonts.quicksand(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
          ),

          // Second TextFormField
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              height: 60,
              child: TextFormField(
                controller: _secondPinController,
                cursorColor: secondaryColor,
                onChanged: (value) {
                  if (value.length == 1 &&
                      _secondPinController.text.isNotEmpty) {
                    FocusScope.of(context).nextFocus();
                  } else if (value.length == 0) {
                    FocusScope.of(context).previousFocus();
                  }
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: textFieldBorderColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  filled: true,
                  fillColor: textfieldColor,
                  focusColor: textfieldColor,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: textFieldBorderColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: GoogleFonts.quicksand(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
          ),

          // Third TextFormField
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              height: 60,
              child: TextFormField(
                controller: _thirdPinController,
                cursorColor: secondaryColor,
                onChanged: (value) {
                  if (value.length == 1 &&
                      _thirdPinController.text.isNotEmpty) {
                    FocusScope.of(context).nextFocus();
                  } else if (value.length == 0) {
                    FocusScope.of(context).previousFocus();
                  }
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: textFieldBorderColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  filled: true,
                  fillColor: textfieldColor,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: textFieldBorderColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: textFieldBorderColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: GoogleFonts.quicksand(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
          ),

          // Fourth TextFormField
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              height: 60,
              child: TextFormField(
                controller: _fourthPinController,
                cursorColor: secondaryColor,
                onChanged: (value) {
                  if (value.length == 1 &&
                      _fourthPinController.text.isNotEmpty) {
                    FocusScope.of(context).nextFocus();
                  } else if (value.length == 0) {
                    FocusScope.of(context).previousFocus();
                  }
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: textFieldBorderColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  filled: true,
                  fillColor: textfieldColor,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: textFieldBorderColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: textFieldBorderColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: GoogleFonts.quicksand(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
          ),

          // Fifth TextFormField
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              height: 60,
              child: TextFormField(
                controller: _fifthPinController,
                cursorColor: secondaryColor,
                onChanged: (value) {
                  if (value.length == 1 &&
                      _fifthPinController.text.isNotEmpty) {
                    FocusScope.of(context).nextFocus();
                  } else if (value.length == 0) {
                    FocusScope.of(context).previousFocus();
                  }
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: textFieldBorderColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  filled: true,
                  fillColor: textfieldColor,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: textFieldBorderColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: textFieldBorderColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: GoogleFonts.quicksand(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
          ),

          // Sixth TextFormField
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              height: 60,
              child: TextFormField(
                controller: _sixthPinController,
                cursorColor: secondaryColor,
                onChanged: (value) {
                  if (value.length == 1 &&
                      _sixthPinController.text.isNotEmpty) {
                    FocusScope.of(context).unfocus();
                  } else if (value.length == 0) {
                    FocusScope.of(context).previousFocus();
                  }
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: textFieldBorderColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  filled: true,
                  fillColor: textfieldColor,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: textFieldBorderColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: textFieldBorderColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: GoogleFonts.quicksand(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

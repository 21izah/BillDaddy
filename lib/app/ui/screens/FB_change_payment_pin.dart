import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants/data_constant.dart';

class FbChangePaymentPin extends StatefulWidget {
  const FbChangePaymentPin({super.key});

  @override
  State<FbChangePaymentPin> createState() => _FbChangePaymentPinState();
}

class _FbChangePaymentPinState extends State<FbChangePaymentPin> {
  final _firstPinController = TextEditingController();

  final _secondPinController = TextEditingController();

  final _thirdPinController = TextEditingController();

  final _fourthPinController = TextEditingController();
  final _first02PinController = TextEditingController();

  final _second02PinController = TextEditingController();

  final _third02PinController = TextEditingController();

  final _fourth02PinController = TextEditingController();

  @override
  void dispose() {
    _firstPinController.dispose();
    _secondPinController.dispose();
    _thirdPinController.dispose();
    _fourthPinController.dispose();
    _first02PinController.dispose();
    _second02PinController.dispose();
    _third02PinController.dispose();
    _fourth02PinController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: background02,
        appBar: AppBar(
          leadingWidth: screenSize.width * 0.8,
          leading: Padding(
            padding: EdgeInsets.only(
              left: screenSize.width * 0.05,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: w400_20(
                      context,
                      'Change payment PIN',
                      blackColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: whiteColor,
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
                padding: const EdgeInsets.only(left: 20.0, right: 10),
                child: w400_16(
                    context,
                    'The payment PIN must contain number which cannot be repeated or consecutive',
                    blackColor),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 30),
                child: w400_16(context, 'New payment PIN', blackColor),
              ),
              const SizedBox(
                height: 10,
              ),
              content(),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20),
                child: w400_16(context, 'Confirm New payment PIN', blackColor),
              ),
              const SizedBox(
                height: 10,
              ),
              content02(),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/fbSuccessful');
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
                        borderRadius: BorderRadius.circular(10),
                        color: secondaryColor),
                    child:
                        Center(child: w500_17(context, 'Confirm', whiteColor)),
                  ),
                ),
              ),
            ],
          ),
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
        ],
      ),
    );
  }

  Widget content02() {
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
                controller: _first02PinController,
                cursorColor: secondaryColor,
                onChanged: (value) {
                  if (value.length == 1 &&
                      _first02PinController.text.isNotEmpty) {
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
                controller: _second02PinController,
                cursorColor: secondaryColor,
                onChanged: (value) {
                  if (value.length == 1 &&
                      _second02PinController.text.isNotEmpty) {
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
                controller: _third02PinController,
                cursorColor: secondaryColor,
                onChanged: (value) {
                  if (value.length == 1 &&
                      _third02PinController.text.isNotEmpty) {
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
                controller: _fourth02PinController,
                cursorColor: secondaryColor,
                onChanged: (value) {
                  if (value.length == 1 &&
                      _fourth02PinController.text.isNotEmpty) {
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
        ],
      ),
    );
  }
}

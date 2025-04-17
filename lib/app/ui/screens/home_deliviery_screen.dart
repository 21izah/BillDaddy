import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:page_transition/page_transition.dart';

import '../../utils/constants/data_constant.dart';
import 'card_details_sent.dart';

class HomeDelivieryScreen extends StatefulWidget {
  const HomeDelivieryScreen({super.key});

  @override
  State<HomeDelivieryScreen> createState() => _HomeDelivieryScreenState();
}

class _HomeDelivieryScreenState extends State<HomeDelivieryScreen> {
  final _stateController = TextEditingController();
  final _cityController = TextEditingController();
  final _address1Controller = TextEditingController();
  final _address2Controller = TextEditingController();
  final _postalCodeController = TextEditingController();

  Color _containerColor = Colors.grey.shade200;
  Color _containerTextColor = Colors.grey;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _stateController.dispose();
    _cityController.dispose();

    _address1Controller.dispose();

    _address2Controller.dispose();
    _postalCodeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
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
                    child: w600_17(context, 'Home Address', blackColor),
                  ),
                ],
              ),
            ),
          ),
          // centerTitle: true,
          // title: w700_27(
          //   context,
          //   'Home Address',
          //   blackColor,
          // ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 20,
                    left: 10,
                    right: 10,
                  ),
                  child: w700_27(
                    context,
                    'Fill all details',
                    blackColor,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 15, 10, 5),
                  child: TextFormField(
                    style: TextStyle(
                      color: blackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                    cursorColor: secondaryColor,
                    keyboardType: TextInputType.text,
                    controller: _stateController,
                    decoration: InputDecoration(
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('State '),
                        ],
                      ),
                      labelStyle: buttonText04Style(cardRadialColor01),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      filled: false,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: textFieldBorderColor),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: textFieldBorderColor),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: textFieldBorderColor),
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 15, 10, 5),
                  child: TextFormField(
                    style: TextStyle(
                      color: blackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                    cursorColor: secondaryColor,
                    keyboardType: TextInputType.text,
                    controller: _cityController,
                    decoration: InputDecoration(
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('City '),
                        ],
                      ),
                      labelStyle: buttonText04Style(cardRadialColor01),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      filled: false,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: textFieldBorderColor),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: textFieldBorderColor),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: textFieldBorderColor),
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 15, 10, 5),
                  child: TextFormField(
                    style: TextStyle(
                      color: blackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                    cursorColor: secondaryColor,
                    keyboardType: TextInputType.text,
                    controller: _address1Controller,
                    decoration: InputDecoration(
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Address 1 '),
                        ],
                      ),
                      labelStyle: buttonText04Style(cardRadialColor01),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      filled: false,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: textFieldBorderColor),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: textFieldBorderColor),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: textFieldBorderColor),
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 15, 10, 5),
                  child: TextFormField(
                    style: TextStyle(
                      color: blackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                    cursorColor: secondaryColor,
                    keyboardType: TextInputType.text,
                    controller: _address2Controller,
                    decoration: InputDecoration(
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Address 2 '),
                        ],
                      ),
                      labelStyle: buttonText04Style(cardRadialColor01),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      filled: false,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: textFieldBorderColor),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: textFieldBorderColor),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: textFieldBorderColor),
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 15, 10, 5),
                  child: TextFormField(
                    style: TextStyle(
                      color: blackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                    cursorColor: secondaryColor,
                    keyboardType: TextInputType.text,
                    controller: _postalCodeController,
                    decoration: InputDecoration(
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Postal Code '),
                        ],
                      ),
                      labelStyle: buttonText04Style(cardRadialColor01),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      filled: false,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: textFieldBorderColor),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: textFieldBorderColor),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: textFieldBorderColor),
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      PageTransition(
                          child: CardDetailsSent(),
                          type: PageTransitionType.leftToRight
                          // duration: Duration(seconds: 1),
                          ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: screenSize.height * 0.2,
                      left: screenSize.width * 0.02,
                      right: screenSize.width * 0.02,
                      bottom: screenSize.height * 0.02,
                    ),
                    alignment: Alignment.center,
                    height: 40,
                    width: screenSize.width,
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:
                        Center(child: w500_17(context, 'Submit', whiteColor)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/data_constant.dart';

class TransferToEgofinaceScreen extends StatefulWidget {
  final String name;
  final String accountNumber;
  final String walletId;

  const TransferToEgofinaceScreen(
      {super.key,
      required this.name,
      required this.accountNumber,
      required this.walletId});

  @override
  State<TransferToEgofinaceScreen> createState() =>
      _TransferToEgofinaceScreenState();
}

class _TransferToEgofinaceScreenState extends State<TransferToEgofinaceScreen> {
  final _amountController = TextEditingController();
  final _remarkController = TextEditingController();
  bool isChecked = false;
  @override
  void dispose() {
    _remarkController.dispose();
    _amountController.dispose();
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
          centerTitle: false,
          title: w600_17(
            context,
            'Transfer to EgoFinance Account',
            blackColor,
          ),
          backgroundColor: whiteColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          color: Colors.primaries[
                              Random().nextInt(Colors.primaries.length)]),
                      child: Center(
                          child: Text(
                        '${widget.walletId}',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      w400_20(
                        context,
                        '${widget.name}',
                        blackColor,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0.0, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      w400_17(
                        context,
                        '${widget.accountNumber}',
                        blackColor,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      w500_14(
                        context,
                        'Amount',
                        blackColor,
                      ),
                    ],
                  ),
                ),
                Container(
                  // padding: const EdgeInsets.all(1.0),
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
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
                      prefixIcon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          svgAsset(
                            'lib/assets/tabler_currency-naira.svg',
                          ),
                        ],
                      ),
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Enter Amount'),
                        ],
                      ),
                      labelStyle: buttonText04Style(cardRadialColor01),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      fillColor: whiteColor,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: secondaryColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: secondaryColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: secondaryColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      w500_14(
                        context,
                        'Recipient Account',
                        blackColor,
                      ),
                    ],
                  ),
                ),
                Container(
                  // padding: const EdgeInsets.all(1.0),
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                  child: TextFormField(
                    autofocus: false,
                    style: TextStyle(
                      color: blackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                    cursorColor: secondaryColor,
                    keyboardType: TextInputType.text,
                    controller: _remarkController,
                    validator: (value) =>
                        value!.isEmpty ? 'Remark is required' : null,
                    decoration: InputDecoration(
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Remark'),
                        ],
                      ),
                      labelStyle: buttonText04Style(cardRadialColor01),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      fillColor: whiteColor,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: whiteColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: whiteColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: whiteColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/transferReceipt');
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: screenSize.height * 0.1,
                      bottom: screenSize.height * 0.02,
                    ),
                    child: Container(
                      height: screenSize.height * 0.05,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

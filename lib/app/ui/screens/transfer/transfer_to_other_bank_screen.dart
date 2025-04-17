import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:lottie/lottie.dart';

import '../../../controllers/transfer/transfer_to_other_bank_provider.dart';
import '../../../utils/constants/data_constant.dart';
import 'transfer_to_otherBank_pin_screen.dart';

class TransferToOtherBankScreen extends StatefulWidget {
  final String bankName;
  final String bankCode;
  final String recepientName;
  final String bankAccount;
  final String walletId;
  const TransferToOtherBankScreen({
    super.key,
    required this.bankName,
    required this.bankCode,
    required this.recepientName,
    required this.bankAccount,
    required this.walletId,
  });

  @override
  State<TransferToOtherBankScreen> createState() =>
      _TransferToOtherBankScreenState();
}

class _TransferToOtherBankScreenState extends State<TransferToOtherBankScreen> {
  final _amountController = TextEditingController();
  final _remarkController = TextEditingController();
  bool isChecked = false;
  final box = GetStorage();

  void openTransactionDetailsSheet() {
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
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        w700_17(context, 'Confirm Recipient', blackColor),
                      ],
                    ),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            w400_14(context, 'Name', blackColor),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: textfieldColor,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: w400_14(context,
                                        '${widget.recepientName}', blackColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(color: textFieldBorderColor),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            w400_14(context, 'Account No.', blackColor),
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
                                        '${widget.bankAccount}', blackColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(color: textFieldBorderColor),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            w400_14(context, 'Bank', blackColor),
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
                                        '${widget.bankName}', blackColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(color: textFieldBorderColor),
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
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0.0),
                                    child: w400_14(
                                        context,
                                        '₦ ${_amountController.text}',
                                        blackColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(color: textFieldBorderColor),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      box.write('remark', _remarkController.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TransferToOtherBankPinScreen(
                            recipientAccountNumber: widget.bankAccount,
                            recipientBank: widget.bankName,
                            recipientCode: widget.bankCode,
                            recipientName: widget.recepientName,
                            walletId: widget.walletId,
                            amount: _amountController.text,
                            reason: _remarkController.text,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 10,
                        bottom: screenSize.height * 0.035,
                      ),
                      alignment: Alignment.center,
                      height: screenSize.height * 0.05,
                      width: screenSize.width,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: w500_17(context, 'Confirm', whiteColor),
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
  void dispose() {
    _remarkController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final TransferToOtherBankController transferToOtherBankController =
        Get.find<TransferToOtherBankController>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: background02,
        appBar: transferToOtherBankController.isGetBankListLoading
            ? null
            : AppBar(
                centerTitle: false,
                title: w600_17(
                  context,
                  'Transfer to Bank Account',
                  blackColor,
                ),
                backgroundColor: whiteColor,
              ),
        body: transferToOtherBankController.isGetBankListLoading
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Lottie.asset('lib/assets/rPUhRrTlFG.json'),
                    ),
                  ],
                ),
              )
            : SingleChildScrollView(
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
                              'E',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
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
                              '${widget.recepientName}',
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
                            Expanded(
                              child: w400_17_wC(
                                context,
                                '${widget.bankName} ${widget.bankAccount}',
                                blackColor,
                              ),
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
                              'Remark',
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
                          openTransactionDetailsSheet();
                          // context.go('/transferReceipt');
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
                              borderRadius: BorderRadius.circular(100),
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

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:page_transition/page_transition.dart';

import '../../../controllers/transfer/transfer_controller.dart';
import '../../../controllers/transfer/transfer_to_other_bank_provider.dart';
import '../../../utils/constants/data_constant.dart';
import '../bottomNavigation.dart';
import 'transfer_to_egoFinace-success_screen.dart';
import 'transfer_to_otherBank-success_screen.dart';
import 'package:intl/intl.dart';

class TransferToOtherBankScreenReceipt extends StatefulWidget {
  const TransferToOtherBankScreenReceipt({
    super.key,
  });

  @override
  State<TransferToOtherBankScreenReceipt> createState() =>
      _TransferToOtherBankScreenReceiptState();
}

class _TransferToOtherBankScreenReceiptState
    extends State<TransferToOtherBankScreenReceipt> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final box = GetStorage();
    final TransferToOtherBankController transferToOtherBankController =
        Get.find<TransferToOtherBankController>();
    final TransferController transferController =
        Get.find<TransferController>();
    var transactionDetails =
        transferToOtherBankController.transferToOtherBankModel.value;
    var moneySent = transactionDetails!.data!.transactionDetails!.amount;
    var date = transactionDetails.data!.transactionDetails!.createdAt;
    String _getOrdinalSuffix(int day) {
      if (day >= 11 && day <= 13) {
        return 'th';
      }
      switch (day % 10) {
        case 1:
          return 'st';
        case 2:
          return 'nd';
        case 3:
          return 'rd';
        default:
          return 'th';
      }
    }

    // Parse the string into a DateTime object
    DateTime dateTime = DateTime.parse(date!);
    // Format the DateTime object
    String formattedDate = DateFormat('MMM d, h:mm a').format(dateTime);

    // Add the ordinal suffix (e.g., 1st, 2nd, 3rd, 4th)
    String day = dateTime.day.toString();
    String suffix = _getOrdinalSuffix(dateTime.day);
    formattedDate = formattedDate.replaceFirst(day, '$day$suffix');

    var status = transactionDetails.data!.transactionDetails!.status;
    var senderAccount =
        transactionDetails.data!.transactionDetails!.senderAccount;
    var recipientAccount = transactionDetails
      ..data!.transactionDetails!.recipientAccount;
    // var transactionNumber = transactionDetails.data!.transactionDetails.;
    var category = transactionDetails.data!.transactionDetails!.transactionType;

    var senderDetails = transferController.accountDetails1.value;
    var senderName = senderDetails?.user.name;

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
                    Get.to(BottomNavigation());
                    // Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: w600_17(context, 'Transaction Details', blackColor),
                ),
              ],
            ),
          ),
        ),
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
                          margin: EdgeInsets.only(left: 20),
                          child: Image.asset(
                            'lib/assets/egoFI01.png',
                            height: 30,
                          ),

                          // svgAsset(
                          //   'lib/assets/card-sendcard.svg',
                          // ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0, top: 20),
                          child: w700_12(
                              context, 'Transaction Receipt', blackColor),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, top: 20),
                      child: w700_12(context, 'Amount', texdColor01),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, top: 0),
                      child: w800_24(context, '₦ ${moneySent}', secondaryColor),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, top: 00),
                      child: Container(
                          padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.lightGreenAccent,
                          ),
                          child: w700_12(context, '${status!.toLowerCase()}',
                              Colors.green)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 30),
                      child:
                          w700_12(context, 'Transaction Amount: ', blackColor),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, top: 30),
                      child: w700_12(context, '₦ ${moneySent}', texdColor01),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 0),
                      child: w700_12(context, 'Charge: ', blackColor),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, top: 0),
                      child: w700_12(
                          context,
                          '${transactionDetails.data!.transactionDetails!.transactionFee}',
                          texdColor01),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 10, left: 20, right: 20),
                  child: Divider(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 5),
                      child: w700_12(context, 'Total Debt: ', blackColor),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, top: 5),
                      child: w700_12(context, '₦ ${moneySent}', texdColor01),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 30),
                      child: w700_12(context, 'Recipient', blackColor),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 0),
                      child: w700_12(
                          context,
                          '${transactionDetails.data!.transactionDetails!.recipientName}',
                          secondaryColor),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 0.0, bottom: 10, left: 20, right: 20),
                  child: Divider(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 0),
                      child: w700_12(context, 'Recipient Bank', blackColor),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 0),
                      child: w700_12(
                          context,
                          '${transactionDetails.data!.transactionDetails!.recipientBank}',
                          secondaryColor),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 0.0, bottom: 10, left: 20, right: 20),
                  child: Divider(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 0),
                      child: w700_12(context, 'Sender', blackColor),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 0),
                      child: w700_12(
                          context,
                          '${transactionDetails.data!.transactionDetails!.senderAccount}',
                          secondaryColor),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 0.0, bottom: 10, left: 20, right: 20),
                  child: Divider(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 0),
                      child: w700_12(context, 'Transaction Date', blackColor),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 0),
                      child:
                          w700_12(context, '${formattedDate}', secondaryColor),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 0.0, bottom: 10, left: 20, right: 20),
                  child: Divider(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 0),
                      child:
                          w700_12(context, 'Transaction Reference', blackColor),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 0),
                      child: Container(
                        width: screenSize.width * 0.8,
                        child: w700_12_sw(
                            context,
                            '${transactionDetails.data!.transactionDetails!.id}',
                            secondaryColor),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 10, left: 20, right: 20),
                  child: Divider(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 5),
                      child: w700_12(context, 'Transaction Type', blackColor),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 0),
                      child: w700_12(
                          context,
                          '${transactionDetails.data!.transactionDetails!.transactionType}',
                          secondaryColor),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 10, left: 20, right: 20),
                  child: Divider(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 0),
                      child: w700_12(context, "What's it for?", blackColor),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, bottom: 10),
                      child:
                          w700_12(context, 'Any Transaction', secondaryColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              // _showBottomDialog(context);
              Navigator.of(context).push(
                PageTransition(
                    child: TransferToOtherBankSuccessScreen(),
                    type: PageTransitionType.leftToRight
                    // duration: Duration(seconds: 1),

                    ),
              );
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
              child: w500_14(context, 'Next', whiteColor),
            ),
          ),
        ],
      ),
    );
  }
}

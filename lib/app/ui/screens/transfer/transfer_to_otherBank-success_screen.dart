import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:lottie/lottie.dart';

import '../../../controllers/transfer/transfer_to_other_bank_provider.dart';
import '../../../utils/constants/data_constant.dart';
import '../bottomNavigation.dart';
import '../create_pdf_transferToOtherBank.dart';

class TransferToOtherBankSuccessScreen extends StatefulWidget {
  const TransferToOtherBankSuccessScreen({super.key});

  @override
  State<TransferToOtherBankSuccessScreen> createState() =>
      _TransferToOtherBankSuccessScreenState();
}

class _TransferToOtherBankSuccessScreenState
    extends State<TransferToOtherBankSuccessScreen> {
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final TransferToOtherBankController transferToOtherBankController =
        Get.find<TransferToOtherBankController>();
    var transactionDetails =
        transferToOtherBankController.transferToOtherBankModel.value;
    var moneySent = transactionDetails!.data!.transactionDetails!.amount;
    return Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            20, screenSize.height * 0.1, 20, screenSize.height * 0.1),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              child: Lottie.asset('lib/assets/checkAnimation.json'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  w700_20(context, 'Transfer Successful', blackColor),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    child: w400_14_textAlign_C(
                        context,
                        '${moneySent} NGN has been transferred to ${transactionDetails.data!.transactionDetails!.recipientName} ${transactionDetails.data!.transactionDetails!.recipientBank}',
                        Color.fromRGBO(51, 51, 51, 0.7)),
                  ),
                ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     w400_14(
            //         context,
            //         '${transactionDetails.data!.transactionDetails!.recipientBank}',
            //         Color.fromRGBO(51, 51, 51, 0.7)),
            //   ],
            // ),
            GestureDetector(
              onTap: () {
                PdfGenerator06().generateAndShareTransferToOtherBankReceipt();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(5, 71, 138, 0.06),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.only(top: 40, bottom: 50),
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(4, 140, 252, 0.15),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: svgAsset(
                            'lib/assets/shareReceipt.svg',
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
                                    context, 'Share Receipt', blackColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        right: 10,
                      ),
                      height: 22,
                      width: 22,
                      child: svgAsset(
                        'lib/assets/share-24.svg',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                box.write('remark', '');
                Get.to(BottomNavigation());
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(),
                height: 40,
                width: screenSize.width,
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromRGBO(4, 140, 252, 0.5)),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: w500_14(
                  context,
                  'Done',
                  Color.fromRGBO(4, 140, 252, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

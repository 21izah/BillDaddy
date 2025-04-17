import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../controllers/transfer/transfer_to_other_bank_provider.dart';

class PdfGenerator06 {
  // Pass ref as a parameter to the method
  Future<void> generateAndShareTransferToOtherBankReceipt() async {
    // Access transaction details using ref
    final TransferToOtherBankController transferToOtherBankController =
        Get.find<TransferToOtherBankController>();
    var transactionDetails =
        transferToOtherBankController.transferToOtherBankModel.value;
    if (transactionDetails == null) {
      throw Exception("Transaction details are not available.");
    }

    var moneySent = transactionDetails.data!.transactionDetails!.amount;
    var date = transactionDetails.data!.transactionDetails!.createdAt;

    // Helper function to get ordinal suffix
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
    var recipientAccount =
        transactionDetails.data!.transactionDetails!.recipientAccount;
    var transactionNumber =
        transactionDetails.data!.transactionDetails!.reference;
    var category = transactionDetails.data!.transactionDetails!.transactionType;

    // var senderDetails = ref.watch(userAccountDetailsProvider);
    // var senderName = senderDetails!.user.name;

    // ------------------------------------------------------------------------
    final pdf = pw.Document();

    // Load custom font
    final fontData =
        await rootBundle.load('lib/assets/fonts/Roboto-Regular.ttf');
    final boldFontData =
        await rootBundle.load('lib/assets/fonts/Roboto-Bold.ttf');
    final image =
        (await rootBundle.load('lib/assets/egoFI01.png')).buffer.asUint8List();
    final font = pw.Font.ttf(fontData);
    final boldFont = pw.Font.ttf(boldFontData);

    // Add a page to the PDF
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Row(
                    children: [
                      pw.Container(
                        margin: pw.EdgeInsets.only(left: 20),
                        child: pw.Image(
                          pw.MemoryImage(
                            image,
                          ),
                          height: 30,
                        ),

                        // svgAsset(
                        //   'lib/assets/card-sendcard.svg',
                        // ),
                      ),
                    ],
                  ),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.only(right: 20.0, top: 20),
                        child: pw.Text(
                          'Transaction Receipt',
                          style: pw.TextStyle(
                            fontSize: 12,
                            fontBold: boldFont,
                            color: PdfColors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Padding(
                      padding: const pw.EdgeInsets.only(right: 20.0, top: 20),
                      child: pw.Text(
                        'Amount',
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontBold: boldFont,
                          color: PdfColors.grey,
                        ),
                      )),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(right: 20.0, top: 0),
                    child: pw.Text(
                      'NGN ${moneySent}',
                      style: pw.TextStyle(
                        fontSize: 24,
                        fontBold: boldFont,
                        color: PdfColors.blue900,
                      ),
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(right: 20.0, top: 00),
                    child: pw.Container(
                      padding: pw.EdgeInsets.fromLTRB(5, 2, 5, 2),
                      decoration: pw.BoxDecoration(
                        borderRadius: pw.BorderRadius.circular(5),
                        color: PdfColors.lightGreenAccent,
                      ),
                      child: pw.Text(
                        '${status!.toLowerCase()}',
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontBold: boldFont,
                          color: PdfColors.blue900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 20.0, top: 30),
                    child: pw.Text(
                      'Transaction Amount: ',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontBold: boldFont,
                        color: PdfColors.black,
                      ),
                    ),

                    // w700_12(context, 'Transaction Amount: ', blackColor),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(right: 20.0, top: 30),
                    child: pw.Text(
                      'NGN ${moneySent}',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontBold: boldFont,
                        color: PdfColors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 20.0, top: 0),
                    child: pw.Text(
                      'Charge: ',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontBold: boldFont,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(right: 20.0, top: 0),
                    child: pw.Text(
                      '${transactionDetails.data!.transactionDetails!.transactionFee}',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontBold: boldFont,
                        color: PdfColors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.only(
                    top: 10.0, bottom: 10, left: 20, right: 20),
                child: pw.Divider(),
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 20.0, top: 5),
                    child: pw.Text(
                      'Total Debt: ',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontBold: boldFont,
                        color: PdfColors.black,
                      ),
                    ),

                    // w700_12(context, 'Total Debt: ', blackColor),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(right: 20.0, top: 5),
                    child: pw.Text(
                      'NGN ${moneySent}',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontBold: boldFont,
                        color: PdfColors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 20.0, top: 30),
                    child: pw.Text(
                      'Recipient Account',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontBold: boldFont,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 20.0, top: 0),
                    child: pw.Text(
                      '${recipientAccount}',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontBold: boldFont,
                        color: PdfColors.blue900,
                      ),
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 20.0, top: 30),
                    child: pw.Text(
                      'Recipient Name',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontBold: boldFont,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 20.0, top: 0),
                    child: pw.Text(
                      '${transactionDetails.data!.transactionDetails!.recipientName}',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontBold: boldFont,
                        color: PdfColors.blue900,
                      ),
                    ),
                  ),
                ],
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.only(
                    top: 0.0, bottom: 10, left: 20, right: 20),
                child: pw.Divider(),
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 20.0, top: 0),
                    child: pw.Text(
                      'Recipient Bank',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontBold: boldFont,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 20.0, top: 0),
                    child: pw.Text(
                      '${transactionDetails.data!.transactionDetails!.recipientBank}',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontBold: boldFont,
                        color: PdfColors.blue900,
                      ),
                    ),
                  ),
                ],
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.only(
                    top: 0.0, bottom: 10, left: 20, right: 20),
                child: pw.Divider(),
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 20.0, top: 0),
                    child: pw.Text(
                      'Sender',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontBold: boldFont,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 20.0, top: 0),
                    child: pw.Text(
                      '${transactionDetails.data!.transactionDetails!.senderAccount}',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontBold: boldFont,
                        color: PdfColors.blue900,
                      ),
                    ),
                  ),
                ],
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.only(
                    top: 0.0, bottom: 10, left: 20, right: 20),
                child: pw.Divider(),
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 20.0, top: 0),
                    child: pw.Text(
                      'Transaction Date',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontBold: boldFont,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 20.0, top: 0),
                    child: pw.Text(
                      '${formattedDate}',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontBold: boldFont,
                        color: PdfColors.blue900,
                      ),
                    ),
                  ),
                ],
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.only(
                    top: 0.0, bottom: 10, left: 20, right: 20),
                child: pw.Divider(),
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 20.0, top: 0),
                    child: pw.Text(
                      'Transaction Reference',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontBold: boldFont,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 20.0, top: 0),
                    child: pw.Container(
                      // width: pw.screenSize.width * 0.8,
                      child: pw.Text(
                        '${transactionDetails.data!.transactionDetails!.id}',
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontBold: boldFont,
                          color: PdfColors.blue900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.only(
                    top: 10.0, bottom: 10, left: 20, right: 20),
                child: pw.Divider(),
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 20.0, top: 5),
                    child: pw.Text(
                      'Transaction Type',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontBold: boldFont,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 20.0, top: 0),
                    child: pw.Text(
                      '${transactionDetails.data!.transactionDetails!.transactionType}',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontBold: boldFont,
                        color: PdfColors.blue900,
                      ),
                    ),
                  ),
                ],
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.only(
                    top: 10.0, bottom: 10, left: 20, right: 20),
                child: pw.Divider(),
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 20.0, top: 0),
                    child: pw.Text(
                      "What's it for?",
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontBold: boldFont,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 20.0, bottom: 10),
                    child: pw.Text(
                      'Any Transaction',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontBold: boldFont,
                        color: PdfColors.blue900,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );

    // Save PDF file
    final output = await getTemporaryDirectory();
    final file = File("${output.path}/transaction_receipt.pdf");
    await file.writeAsBytes(await pdf.save());

    // Share the PDF
    Share.shareXFiles([XFile(file.path)], text: 'Transaction Receipt');
  }

  // Helper method to create a row
  pw.Widget _buildTransactionRow(String title, String value) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(
            title,
            style: pw.TextStyle(color: PdfColors.grey),
          ),
          pw.Text(
            value,
            style: pw.TextStyle(color: PdfColors.black),
          ),
        ],
      ),
    );
  }
}

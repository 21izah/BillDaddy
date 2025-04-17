import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import 'package:flutter/services.dart' show rootBundle;

class PdfGenerator1 {
  Future<void> generateAndSharePdf01() async {
    final pdf = pw.Document();

    // Load custom font
    final fontData =
        await rootBundle.load('lib/assets/fonts/Roboto-Regular.ttf');
    final boldFontData =
        await rootBundle.load('lib/assets/fonts/Roboto-Bold.ttf');
    final font = pw.Font.ttf(fontData);
    final boldFont = pw.Font.ttf(boldFontData);

    // Add a page to the PDF
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Align(
                alignment: pw.Alignment.centerRight,
                child: pw.Padding(
                  padding: const pw.EdgeInsets.only(right: 20, top: 30),
                  child: pw.Text(
                    'Transaction Receipt',
                    style: pw.TextStyle(
                      fontSize: 18,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
              ),
              pw.SizedBox(height: 30),
              pw.Stack(
                alignment: pw.Alignment.center,
                children: [
                  pw.Container(
                    width: double.infinity,
                    height: 1,
                    color: PdfColors.grey,
                  ),
                  pw.Container(
                    padding: pw.EdgeInsets.all(20),
                    color: PdfColors.white,
                    child: pw.Row(
                      mainAxisSize: pw.MainAxisSize.min,
                      children: [
                        pw.Text(
                          '-#',
                          style: pw.TextStyle(
                            fontSize: 30,
                            color: PdfColors.blue,
                          ),
                        ),
                        pw.SizedBox(width: 5),
                        pw.Text(
                          '100,000,000,000.00',
                          style: pw.TextStyle(
                            fontSize: 30,
                            color: PdfColors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              pw.SizedBox(height: 10),
              _buildTransactionRow('Transaction Type', 'Electricity'),
              _buildTransactionRow('Paid With', 'BalancePayment'),
              _buildTransactionRow('Service Provider', 'IBEDC'),
              _buildTransactionRow('Meter number', '8182786899'),
              _buildTransactionRow('Bonus', '0.00'),
              _buildTransactionRow('Status', 'Success'),
              pw.Divider(),
              _buildTransactionRow('Transaction number', '632632632676326326'),
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

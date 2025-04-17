import 'package:flutter/material.dart';

import '../../utils/constants/data_constant.dart';
import 'create_pdf_electricity.dart';

class BettingShareScreen extends StatefulWidget {
  const BettingShareScreen({super.key});

  @override
  State<BettingShareScreen> createState() => _BettingShareScreenState();
}

class _BettingShareScreenState extends State<BettingShareScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background02,
      appBar: AppBar(
        title: w600_20(context, 'Share Receipt', blackColor),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: whiteColor,
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0, top: 30),
                        child:
                            w400_16(context, 'Transaction Receipt', blackColor),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: screenSize.height * 0.03),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 1.0,
                          color: textFieldBorderColor,
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          color: whiteColor,
                          child: Row(
                            mainAxisSize: MainAxisSize.min, // Wrap content
                            children: [
                              Text(
                                '- ₦',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(width: 5),
                              w500_24(context, '100,000,000,000.00',
                                  secondaryColor),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenSize.height * 0.01,
                      bottom: screenSize.height * 0.01,
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        w400_14(context, 'Transaction Type', textColorPrimary),
                        w400_14(context, 'Betting', blackColor),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenSize.height * 0.01,
                      bottom: screenSize.height * 0.01,
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        w400_14(context, 'Paid With', textColorPrimary),
                        w400_14(context, 'BalancePayment', blackColor),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenSize.height * 0.01,
                      bottom: screenSize.height * 0.01,
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        w400_14(context, 'Betting Platform', textColorPrimary),
                        Row(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Image.asset(
                                'lib/assets/PhElec.png',

                                // fit: BoxFit.contain,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: w400_14(context, '1xBET', blackColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenSize.height * 0.01,
                      bottom: screenSize.height * 0.01,
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        w400_14(context, 'User  ID', blackColor),
                        w400_14(context, '818 278 6899', blackColor),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenSize.height * 0.01,
                      bottom: screenSize.height * 0.01,
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        w400_14(context, 'Bonus', textColorPrimary),
                        w400_14(context, '0.00', blackColor),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenSize.height * 0.01,
                      bottom: screenSize.height * 0.01,
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        w400_14(context, 'Status', textColorPrimary),
                        w400_14(context, 'Success', blackColor),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenSize.height * 0.01,
                      bottom: screenSize.height * 0.01,
                      left: 20,
                      right: 20,
                    ),
                    child: Divider(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenSize.height * 0.01,
                      bottom: screenSize.height * 0.01,
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        w400_14(
                            context, 'Transaction number', textColorPrimary),
                        w400_14(context, '632632632676326326', blackColor),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                PdfGenerator1().generateAndSharePdf01();
              },
              child: Container(
                margin: EdgeInsets.only(
                  top: screenSize.height * 0.2,
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
                child: w500_14(context, 'Share Receipt', whiteColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

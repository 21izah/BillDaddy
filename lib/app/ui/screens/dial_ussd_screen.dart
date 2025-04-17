import 'package:flutter/material.dart';

import '../../utils/constants/data_constant.dart';

class DialUssdScreen extends StatefulWidget {
  final String amount;
  final String image;
  final String name;
  const DialUssdScreen(
      {super.key,
      required this.amount,
      required this.image,
      required this.name});

  @override
  State<DialUssdScreen> createState() => _DialUssdScreenState();
}

class _DialUssdScreenState extends State<DialUssdScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        centerTitle: false,
        title: w600_17(
          context,
          'Dial USSD Code',
          blackColor,
        ),
        backgroundColor: whiteColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                w400_12(
                  context,
                  'Dial this code to fund your EgoFinance account',
                  blackColor,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                w400_12(
                  context,
                  'Amount: ',
                  blackColor,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                  child: w400_13(
                    context,
                    '₦ ${widget.amount}',
                    Color.fromRGBO(4, 140, 252, 1),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(4, 140, 252, 0.05),
              ),
              child: Column(
                mainAxisSize:
                    MainAxisSize.min, // Ensures it wraps its children properly
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Align items properly
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.scale(
                        scale: 0.7,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            widget.image,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        // Ensures text wraps properly
                        child: w600_17(
                          context,
                          widget.name,
                          Color.fromRGBO(51, 51, 51, 1),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10), // Ensure separation
                  Align(
                    alignment: Alignment.center,
                    child: w400_12(
                      context,
                      'Dial this code to fund your EgoFinance account',
                      blackColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.center,
                    child: w600_26(
                      context,
                      '*901*000*2345#',
                      secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
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
                    border: Border.all(color: secondaryColor),
                    color: whiteColor,
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        svgAsset('lib/assets/dial_ussd_phone.svg'),
                        w500_17(context, ' Dial', secondaryColor),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

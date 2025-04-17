import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/data_constant.dart';

class PayidScreen extends StatefulWidget {
  const PayidScreen({super.key});

  @override
  State<PayidScreen> createState() => _PayidScreenState();
}

class _PayidScreenState extends State<PayidScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
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
                    Get.offAllNamed('/me');
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: w600_17(context, 'Pay ID', blackColor),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin:
                  EdgeInsets.only(top: 20, bottom: screenSize.height * 0.02),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: whiteColor,
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        w600_17(context, 'STEP 1', blackColor),
                        SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            style: w400_12_s(context, blackColor),
                            children: [
                              TextSpan(
                                text:
                                    'Find a local Payment Gateway that supports EgoFinance',
                              ),
                              TextSpan(
                                text: ' Wallet ',
                                style: w500_14_s(context, blackColor),
                              ),
                              TextSpan(
                                text: 'payment and select EgoFinance wallet.',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Divider(color: textFieldBorderColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        w600_17(context, 'STEP 2', blackColor),
                        SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            style: w400_12_s(context, blackColor),
                            children: [
                              TextSpan(text: 'Click'),
                              TextSpan(
                                text: ' “Generate Pay ID” ',
                                style: w500_14_s(context, blackColor),
                              ),
                              TextSpan(
                                text:
                                    'on the EgoFinance App to get your online payment code. The code will be valid for 10 minutes.',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Divider(color: textFieldBorderColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        w600_17(context, 'STEP 3', blackColor),
                        SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            style: w400_12_s(context, blackColor),
                            children: [
                              TextSpan(
                                text:
                                    'Enter your registered EgoFinance phone number and payment ID and click ',
                              ),
                              TextSpan(
                                text: ' “Pay Now” ',
                                style: w500_14_s(context, blackColor),
                              ),
                              TextSpan(
                                text: 'to complete transaction',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(
                  top: screenSize.height * 0.2,
                  left: 20,
                  right: 20,
                  bottom: screenSize.height * 0.04,
                ),
                child: Container(
                  height: screenSize.height * 0.06,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: secondaryColor,
                  ),
                  child: Center(
                    child: w500_17(context, 'Generate Pay ID', whiteColor),
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

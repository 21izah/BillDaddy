import 'package:flutter/material.dart';

import '../../utils/constants/data_constant.dart';

class ScanQrcodeScreen extends StatefulWidget {
  const ScanQrcodeScreen({super.key});

  @override
  State<ScanQrcodeScreen> createState() => _ScanQrcodeScreenState();
}

class _ScanQrcodeScreenState extends State<ScanQrcodeScreen> {
  final _amountController = TextEditingController();
  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          centerTitle: false,
          title: w600_17(
            context,
            'Scan QR Code',
            blackColor,
          ),
          backgroundColor: whiteColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 0),
                      child: w400_12(context, 'Use Ego-Finance Scan to pay me',
                          blackColor),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                            top: screenSize.height * 0.04,
                            bottom: screenSize.height * 0.04),
                        child: Image.asset('lib/assets/bi_qr-code.png')),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      w400_16(
                        context,
                        'Enter the Amount',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 0),
                      child: w400_17(context, 'How to use?', blackColor),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: screenSize.width * 0.8,
                      margin: EdgeInsets.only(left: 0),
                      child: Expanded(
                        child: w400_12(
                            context,
                            'Visit the nearest Ego-Finance user/Merchant and ask them to scan your QR code with their Ego-Finance app or POS.',
                            blackColor),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(screenSize.height * 0.08,
                      screenSize.height * 0.27, 0, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      svgAsset('lib/assets/egoFinance03.svg'),
                    ],
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

import 'dart:math';

import 'package:flutter/material.dart';

import '../../utils/constants/data_constant.dart';
import 'request_money_screen02.dart';

class RequestMoneyScreen extends StatefulWidget {
  final String name;
  final String phoneNumber;
  final String nameInitial;
  const RequestMoneyScreen(
      {super.key,
      required this.name,
      required this.phoneNumber,
      required this.nameInitial});

  @override
  State<RequestMoneyScreen> createState() => _RequestMoneyScreenState();
}

class _RequestMoneyScreenState extends State<RequestMoneyScreen> {
  final _amountController = TextEditingController();
  final _remarkController = TextEditingController();
  bool isChecked = false;
  @override
  void dispose() {
    _remarkController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void openBottomSheet() {
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
                          child: Icon(Icons.close))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      w500_14(
                        context,
                        'You are about to send a money request of',
                        blackColor,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: screenSize.height * 0.01,
                        bottom: screenSize.height * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        w500_24(
                          context,
                          '₦ ${_amountController.text}',
                          secondaryColor,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: screenSize.height * 0.01,
                        bottom: screenSize.height * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        w500_14(
                          context,
                          'To',
                          blackColor,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: screenSize.height * 0.01,
                        bottom: screenSize.height * 0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              color: Colors.primaries[
                                  Random().nextInt(Colors.primaries.length)]),
                          child: Center(
                              child: Text(
                            '${widget.nameInitial}',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          )),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            w400_20(
                              context,
                              '${widget.name}',
                              blackColor,
                            ),
                            w400_17(
                              context,
                              '${widget.phoneNumber}',
                              blackColor,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: screenSize.width * 0.85,
                        child: Expanded(
                          child: w400_12(
                            context,
                            'You can notify the recipient of this request before it will expire in 24 hours. ',
                            blackColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RequestMoneyScreen02()),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: screenSize.height * 0.02,
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
                          child: w500_17(context, 'Request Money', whiteColor),
                        ),
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
            'Request Money From Others',
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
                        '${widget.nameInitial}',
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
                        '${widget.phoneNumber}',
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
                      w400_16(
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
                      w400_16(
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
                          Text('Phone No./ Name'),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    w400_14(context, 'Save beneficiary', blackColor),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Container(
                              height: 24,
                              width: 24,
                              child: Transform.scale(
                                scale:
                                    0.7, // Adjust the scale factor to control the size
                                child: SizedBox(
                                  child: Switch.adaptive(
                                    activeColor: secondaryColor,
                                    value: isChecked,
                                    onChanged: (value) =>
                                        setState(() => isChecked = value),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    openBottomSheet();
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

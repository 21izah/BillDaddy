import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/data_constant.dart';

class TopUpScreen extends StatefulWidget {
  const TopUpScreen({super.key});

  @override
  State<TopUpScreen> createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
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
        backgroundColor: background02,
        appBar: AppBar(
          centerTitle: false,
          title: w600_17(
            context,
            'Top-up With Card / Account',
            blackColor,
          ),
          backgroundColor: whiteColor,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
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
                    // contentPadding: EdgeInsets.only(
                    //   left: 15,
                    //   top: 20,
                    //   right: 10,
                    //   bottom: 20,
                    // ),
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
              GestureDetector(
                onTap: () {
                  Get.toNamed('/topUp02');
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
                      child: w500_17(context, 'Next', whiteColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

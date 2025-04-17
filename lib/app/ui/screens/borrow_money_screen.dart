import 'package:flutter/material.dart';

import '../../utils/constants/data_constant.dart';

class BorrowMoneyScreen extends StatefulWidget {
  const BorrowMoneyScreen({super.key});

  @override
  State<BorrowMoneyScreen> createState() => _BorrowMoneyScreenState();
}

class _BorrowMoneyScreenState extends State<BorrowMoneyScreen> {
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
            'Borrow Money',
            blackColor,
          ),
          backgroundColor: whiteColor,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    w400_16(
                      context,
                      'Name / Phone Number',
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
                      value!.isEmpty ? 'Phone No./ Name is required' : null,
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
            ],
          ),
        ),
      ),
    );
  }
}

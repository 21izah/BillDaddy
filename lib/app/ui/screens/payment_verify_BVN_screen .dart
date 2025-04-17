import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/data_constant.dart';

class PaymentVerifyBvnNumberScreen extends StatefulWidget {
  const PaymentVerifyBvnNumberScreen({super.key});

  @override
  State<PaymentVerifyBvnNumberScreen> createState() =>
      _PaymentVerifyBvnNumberScreenState();
}

class _PaymentVerifyBvnNumberScreenState
    extends State<PaymentVerifyBvnNumberScreen> {
  final _bvnController = TextEditingController();

  @override
  void dispose() {
    _bvnController.dispose();

    super.dispose();
  }

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
                    Get.offAllNamed('/paymentVerifyNumber');
                    // Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 10.0),
                //   child: w600_17(context, 'Airtime', blackColor),
                // ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    w600_20(context, 'Please enter BVN', blackColor),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    w400_16(
                      context,
                      'Please provide registered BVN',
                      Color.fromRGBO(
                        51,
                        51,
                        51,
                        0.71,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
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
                  keyboardType: TextInputType.text,
                  controller: _bvnController,
                  validator: (value) =>
                      value!.isEmpty ? 'Bvn number is required' : null,
                  decoration: InputDecoration(
                    // contentPadding: EdgeInsets.only(
                    //   left: 15,
                    //   top: 20,
                    //   right: 10,
                    //   bottom: 20,
                    // ),
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Enter BVN Number'),
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
                  Get.toNamed('/changePaymentPin');
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    top: screenSize.height * 0.2,
                    left: 0,
                    right: 0,
                    bottom: screenSize.height * 0.02,
                  ),
                  child: Container(
                    height: screenSize.height * 0.06,
                    width: screenSize.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: secondaryColor),
                    child: Center(
                        child: w500_17(context, 'Verify BVN', whiteColor)),
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

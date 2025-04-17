import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/data_constant.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _searchController = TextEditingController();
  @override
  void dispose() {
    _searchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: w700_24(
          context,
          'Pay Bills',
          blackColor,
        ),
        backgroundColor: whiteColor,
        leadingWidth: 150,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // padding: const EdgeInsets.all(1.0),
              margin: EdgeInsets.fromLTRB(0, 15, 0, 20),
              child: TextFormField(
                style: TextStyle(
                  color: blackColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
                cursorColor: secondaryColor,
                keyboardType: TextInputType.text,
                controller: _searchController,
                decoration: InputDecoration(
                  prefixIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        color: textFieldBorderColor,
                      )
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
                      Text('Search by name'),
                    ],
                  ),

                  labelStyle: buttonText04Style(cardRadialColor01),
                  floatingLabelBehavior: FloatingLabelBehavior.never,

                  filled: false,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: textFieldBorderColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: textFieldBorderColor),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: textFieldBorderColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: screenSize.height * 0.02,
                    bottom: 10,
                  ),
                  child: w500_14(
                    context,
                    'Payment',
                    blackColor,
                  ),
                ),
              ],
            ),
            Wrap(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/rechargeScreen');
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(248, 248, 248, 1),
                      border:
                          Border.all(color: Color.fromRGBO(223, 226, 228, 0.5)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: screenSize.height * 0.02,
                            width: screenSize.width * 0.06,
                            child: Image.asset(
                              'lib/assets/airtimeP.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          w400_12_02(
                            context,
                            'Airtime',
                            blackColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/dataScreen');
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(248, 248, 248, 1),
                      border:
                          Border.all(color: Color.fromRGBO(223, 226, 228, 0.5)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: screenSize.height * 0.02,
                            width: screenSize.width * 0.06,
                            child: Image.asset(
                              'lib/assets/dataP.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          w400_12_02(
                            context,
                            'Data',
                            blackColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/electricityScreen');
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(248, 248, 248, 1),
                      border:
                          Border.all(color: Color.fromRGBO(223, 226, 228, 0.5)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: screenSize.height * 0.02,
                            width: screenSize.width * 0.06,
                            child: Image.asset(
                              'lib/assets/electricityP.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          w400_12_02(
                            context,
                            'Electricity',
                            blackColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.all(5),
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(248, 248, 248, 1),
                      border:
                          Border.all(color: Color.fromRGBO(223, 226, 228, 0.5)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: screenSize.height * 0.02,
                            width: screenSize.width * 0.06,
                            child: Image.asset(
                              'lib/assets/productShopping.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          w400_12_02(
                            context,
                            'Product',
                            blackColor,
                          ),
                          w400_12_02(
                            context,
                            'Shopping',
                            blackColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/internetScreen');
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(248, 248, 248, 1),
                      border:
                          Border.all(color: Color.fromRGBO(223, 226, 228, 0.5)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: screenSize.height * 0.02,
                            width: screenSize.width * 0.06,
                            child: Image.asset(
                              'lib/assets/internetP.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          w400_12_02(
                            context,
                            'Internet',
                            blackColor,
                          ),
                          w400_12_02(
                            context,
                            'Services',
                            blackColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/tvScreen');
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(248, 248, 248, 1),
                      border:
                          Border.all(color: Color.fromRGBO(223, 226, 228, 0.5)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: screenSize.height * 0.02,
                            width: screenSize.width * 0.06,
                            child: Image.asset(
                              'lib/assets/tvP.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          w400_12_02(
                            context,
                            'Tv Sub',
                            blackColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

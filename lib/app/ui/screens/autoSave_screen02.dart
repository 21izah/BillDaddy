import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/constants/data_constant.dart';

class AutosaveScreen02 extends StatefulWidget {
  const AutosaveScreen02({super.key});

  @override
  State<AutosaveScreen02> createState() => _AutosaveScreen02State();
}

class _AutosaveScreen02State extends State<AutosaveScreen02> {
  List<Map<String, dynamic>> allTransactions = [
    {
      'name': 'Waliyilahi, Juliet Thomas',
      'date': '10 Aug, 11:00AM',
      'transaction_status': 'Successful',
      'transaction_type': 'Debit',
      'amount': '-₦ 12,000.00',
      'iamgePath': 'lib/assets/card-sendcard.svg',
    },
    {
      'name': 'Joyce Williams, Waliyilahi',
      'date': '10 Aug, 11:00AM',
      'transaction_status': 'Successful',
      'transaction_type': 'Credit',
      'amount': '+₦ 24,000.00',
      'iamgePath': 'lib/assets/card-sendcard.svg',
    },
    {
      'name': 'Airtime (MTN Ng)',
      'date': '10 Aug, 11:00AM',
      'transaction_status': 'Successful',
      'transaction_type': 'Debit',
      'amount': '-₦ 2,000.00',
      'iamgePath': 'lib/assets/airtimeAutoSave.svg',
    },
    {
      'name': 'Airtime (MTN Ng)',
      'date': '10 Aug, 11:00AM',
      'transaction_status': 'Successful',
      'transaction_type': 'Debit',
      'amount': '-₦ 12,000.00',
      'iamgePath': 'lib/assets/airtimeAutoSave.svg',
    },
    {
      'name': 'Waliyilahi, Juliet Thomas',
      'date': '10 Aug, 11:00AM',
      'transaction_status': 'Successful',
      'transaction_type': 'Debit',
      'amount': '-₦ 12,000.00',
      'iamgePath': 'lib/assets/card-sendcard.svg',
    },
    {
      'name': 'Waliyilahi, Juliet Thomas',
      'date': '10 Aug, 11:00AM',
      'transaction_status': 'Successful',
      'transaction_type': 'Debit',
      'amount': '-₦ 12,000.00',
      'iamgePath': 'lib/assets/card-sendcard.svg',
    },
    {
      'name': 'Waliyilahi, Juliet Thomas',
      'date': '10 Aug, 11:00AM',
      'transaction_status': 'Successful',
      'transaction_type': 'Debit',
      'amount': '-₦ 12,000.00',
      'iamgePath': 'lib/assets/card-sendcard.svg',
    },
  ];
  bool passwordObscured = true; // Default state
  @override
  void initState() {
    super.initState();
    loadObscuredState();
  }

  // Load the obscured state from Hive
  void loadObscuredState() async {
    final box = GetStorage();

    setState(() {
      passwordObscured = box.read(
        'is_Obscure',
      ); // Load the saved value
    });
  }

  // Toggle the obscured state and save it to Hive
  void obscure() async {
    final box = GetStorage();
    setState(() {
      passwordObscured = !passwordObscured;
      box.write('is_Obscure', passwordObscured); // Save the value in Hive
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    void _showBottomDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
              top: screenSize.height * 0.03,
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    width: screenSize.width, // Full width
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: Offset(0, -5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Title
                        w700_17(
                            context, 'AutoSave has been turned on', blackColor),

                        // Description
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              w400_14(
                                context,
                                'Money in your wallet has been transferred to your EgoFinance wallet.',
                                blackColor,
                              ),
                              // w400_14(
                              //   context,
                              //   '',
                              //   blackColor,
                              // ),
                            ],
                          ),
                        ),

                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Go to EgoVest Button
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  // context.go('/me/autosave02');
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  margin: EdgeInsets.only(
                                      right: 8), // Add spacing between buttons
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(4, 140, 252, 0.2),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: w500_14(
                                      context, 'Ego Wallet', secondaryColor),
                                ),
                              ),
                            ),
                            svgAsset(
                              'lib/assets/autoSaveArrowRight.svg',
                            ),

                            // Ok Button
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  // context.go('/me/savingSetting');
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  margin: EdgeInsets.only(
                                      left: 8), // Add spacing between buttons
                                  decoration: BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child:
                                      w500_14(context, 'EgoVest', whiteColor),
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 20),

                        // Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Go to EgoVest Button
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed('/autosave02');
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  margin: EdgeInsets.only(
                                      right: 8), // Add spacing between buttons
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(4, 140, 252, 0.2),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: w500_14(
                                      context, 'Go to EgoVest', secondaryColor),
                                ),
                              ),
                            ),

                            // Ok Button
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed('/savingSetting');
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  margin: EdgeInsets.only(
                                      left: 8), // Add spacing between buttons
                                  decoration: BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: w500_14(context, 'Ok', whiteColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      // backgroundColor: background02,
      appBar: AppBar(
        centerTitle: false,
        title: w700_24(
          context,
          'AutoSave',
          blackColor,
        ),
        backgroundColor: whiteColor,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: screenSize.height,
            decoration: BoxDecoration(
              color: background02,
            ),
          ),
          Container(
            width: double.infinity,
            height: screenSize.height * 0.25,
            decoration: BoxDecoration(
              color: secondaryColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    w500_14(
                      context,
                      'EgoVest',
                      whiteColor,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  // height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      w700_17(
                        context,
                        'Total Balance',
                        whiteColor,
                      ),
                      passwordObscured
                          ? GestureDetector(
                              onTap: obscure,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 15.0,
                                ),
                                child: Icon(
                                  size: screenSize.height * 0.025,
                                  Icons.visibility,
                                  color: whiteColor,
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: obscure,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 15.0,
                                ),
                                child: Icon(
                                  Icons.visibility_off,
                                  color: whiteColor,
                                  size: screenSize.height * 0.025,
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Container(
                    height: screenSize.height * 0.05,
                    width: screenSize.width * 0.8,
                    child: passwordObscured
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              w700_27(
                                context,
                                '₦ ',
                                whiteColor,
                              ),
                              Container(
                                child: w700_27(
                                  context,
                                  '31,534,000.00',
                                  whiteColor,
                                ),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              w400_44(
                                context,
                                '****',
                                whiteColor,
                              ),
                            ],
                          ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: screenSize.height * 0.02,
                      bottom: screenSize.height * 0.02,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed('/autosaveWithdraw');
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: 05),
                            height: 40,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 0.2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: w500_14(context, 'Withdraw', whiteColor),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _showBottomDialog(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 150,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: w500_14(context, 'Save', secondaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: screenSize.height * 0.22,
            left: screenSize.width * 0.05,
            right: screenSize.width * 0.05,
            child: Container(
              padding: EdgeInsets.all(10),
              height: screenSize.height * 0.06,
              width: screenSize.width * 0.9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(220, 229, 239, 1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      w500_14(context, '20%p.a. ', secondaryColor),
                      w500_14(context, '₦ 100,000', blackColor),
                    ],
                  ),
                  Row(
                    children: [
                      w500_14(context, '10%p.a. ', secondaryColor),
                      w500_14(context, '₦ 2,400.00', blackColor),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: screenSize.height * 0.3,
            left: screenSize.width * 0.05,
            right: screenSize.width * 0.05,
            child: Container(
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(10),
                dashPattern: [6, 3], // Length of the dash and gap
                color: secondaryColor, // Border color
                strokeWidth: 2, // Thickness of the dotted line
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: screenSize.height * 0.06,
                  width: screenSize.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: whiteColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          w500_17(context, 'Autosave', blackColor),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromRGBO(4, 140, 252, 0.15)),
                              padding: EdgeInsets.all(10),
                              child: Center(
                                  child:
                                      w500_12(context, 'On', secondaryColor))),
                          Transform.scale(
                            scale: 0.7,
                            child: Container(
                                child: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: secondaryColor,
                            )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: screenSize.height * 0.4,
            left: screenSize.width * 0.05,
            right: screenSize.width * 0.05,
            child: Container(
              padding: EdgeInsets.all(10),
              height: screenSize.height * 0.06,
              width: screenSize.width * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      w500_17(context, 'Transactions', blackColor),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          child: w500_17(context, 'View All', blackColor)),
                      Transform.scale(
                        scale: 0.7,
                        child: Container(
                            child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: blackColor,
                        )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: screenSize.height * 0.45,
            left: screenSize.width * 0.05,
            right: screenSize.width * 0.05,
            child: Container(
              padding: EdgeInsets.all(0),
              height: screenSize.height * 0.4,
              width: screenSize.width,
              // color: Colors.pink,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: allTransactions.length,
                itemBuilder: (context, index) {
                  final transactionDetail = allTransactions[index];
                  return Container(
                    margin: EdgeInsets.only(
                        bottom: 10, top: 10, left: 10, right: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(4, 140, 252, 1),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: 10,
                                        offset: Offset(0, -5),
                                      ),
                                    ],
                                  ),
                                  child: svgAsset(
                                    '${transactionDetail['iamgePath']}',
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      w500_12(
                                        context,
                                        '${transactionDetail['name']}',
                                        blackColor,
                                      ),
                                      w500_12(
                                        context,
                                        '${transactionDetail['date']}',
                                        blackColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    w500_12(
                                      context,
                                      '${transactionDetail['transaction_type']}',
                                      secondaryColor,
                                    ),
                                    w500_12(
                                      context,
                                      '${transactionDetail['transaction_status']}',
                                      secondaryColor,
                                    ),
                                    w500_12(
                                      context,
                                      '${transactionDetail['amount']}',
                                      blackColor,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        Divider(
                          color: textFieldBorderColor,
                          thickness: 1,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

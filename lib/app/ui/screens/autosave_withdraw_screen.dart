import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/data_constant.dart';

class AutosaveWithdrawScreen extends StatefulWidget {
  const AutosaveWithdrawScreen({super.key});

  @override
  State<AutosaveWithdrawScreen> createState() => _AutosaveWithdrawScreenState();
}

class _AutosaveWithdrawScreenState extends State<AutosaveWithdrawScreen> {
  final _amountController = TextEditingController();
  // State variables to hold the selected package name and price
  String selectedPackageName = 'Select a package';
  String selectedPackagePrice = '';
  List amountPercentages = [
    {
      "percent": "25%",
    },
    {
      "percent": "50%",
    },
    {
      "percent": "75%",
    },
    {
      "percent": "100%",
    },
  ];

  List<bool> isCheckedList = [false, false, false, false, false, false];
  List<bool> isCheckedList01 = [
    false,
    false,
  ];
  List<bool> isCheckedList02 = [];
  List<Map<String, dynamic>> _filteredCompanies = [];
  List<Map<String, dynamic>> _filteredPackages = [];

  bool isEgoFinanceBalance = false;
  bool isBankAccountBalance = false;

  @override
  void initState() {
    super.initState();
    // Initialize isCheckedList02 to match the length of amountPercentages
    isCheckedList02 = List<bool>.filled(amountPercentages.length, false);
  }

  // Method to build the title
  Widget buildPackageTitle() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
        bottom: 10,
      ),
      child: w700_20(context, 'Select Package', blackColor),
    );
  }

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
          title: w700_24(
            context,
            'Withdraw',
            blackColor,
          ),
          backgroundColor: whiteColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    w400_16(
                      context,
                      'Amount',
                      blackColor,
                    ),
                  ],
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
                Container(
                  height: 80,
                  child: StatefulBuilder(builder: (context, setState) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: amountPercentages.length,
                      itemBuilder: (context, index) {
                        final percent = amountPercentages[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              for (int i = 0; i < isCheckedList02.length; i++) {
                                isCheckedList02[i] = (i ==
                                    index); // Set only the tapped index to true
                              }
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Container(
                                  height: 50,
                                  width: 78,
                                  decoration: BoxDecoration(
                                    color: isCheckedList02[index]
                                        ? secondaryColor // Set to secondaryColor if tapped
                                        : Colors
                                            .transparent, // Otherwise, keep it transparent
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: secondaryColor),
                                  ),
                                  child: Center(
                                      child: w600_15(
                                    context,
                                    '${percent['percent']}',
                                    isCheckedList02[index]
                                        ? whiteColor // Set to secondaryColor if tapped
                                        : blackColor,
                                  ) // Otherwise, keep it transparent),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 20, bottom: 8),
                  child: Row(
                    children: [
                      w500_17(
                          context, 'Transfer from EgoVest balance', blackColor),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(19, 71, 151, 0.1)),
                        child: w600_20(context, '₦ 31,534,000.00', blackColor)),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: screenSize.height * 0.05),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x40C4C4C4), // #C4C4C440 with 25% opacity
                        offset: Offset(0, 4), // 0px on x-axis, 4px on y-axis
                        blurRadius: 8, // 8px blur radius
                        spreadRadius: 0, // 0px spread radius (optional)
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 10, bottom: 10),
                        child: Row(
                          children: [
                            w600_20(context, 'Make Payment From', blackColor),
                          ],
                        ),
                      ),
                      StatefulBuilder(
                        builder: (context, setState) {
                          return Container(
                            margin: EdgeInsets.all(0),
                            width: double.infinity,
                            child: Column(
                              children: [
                                // Container 1 - Naira
                                GestureDetector(
                                  onTap: () {
                                    // Update only the tapped container and reset the others
                                    setState(() {
                                      for (int i = 0;
                                          i < isCheckedList01.length;
                                          i++) {
                                        isCheckedList01[i] = (i ==
                                            0); // Only index 0 (first container) is true
                                      }
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: isCheckedList01[0]
                                          ? textfieldColor
                                          : Colors.transparent,
                                    ),
                                    margin: EdgeInsets.only(top: 10),
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Image.asset(
                                                'lib/assets/egoFiBalance.png',
                                                fit: BoxFit.scaleDown,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        child: w400_17(
                                                            context,
                                                            'Ego Finance Balance',
                                                            blackColor),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Transform.scale(
                                          scale: 1.2,
                                          child: Container(
                                            child: Checkbox.adaptive(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20), // Circular shape
                                              ),
                                              value: isCheckedList01[0],
                                              onChanged: (value) {
                                                setState(() {
                                                  for (int i = 0;
                                                      i <
                                                          isCheckedList01
                                                              .length;
                                                      i++) {
                                                    isCheckedList01[i] = (i ==
                                                        0); // Only first checkbox gets checked
                                                  }
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                Divider(color: textFieldBorderColor),

                                // Container 2 - USD
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      for (int i = 0;
                                          i < isCheckedList01.length;
                                          i++) {
                                        isCheckedList01[i] = (i ==
                                            1); // Only second container is true
                                      }
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: isCheckedList01[1]
                                          ? textfieldColor
                                          : Colors.transparent,
                                    ),
                                    margin: EdgeInsets.only(top: 10),
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: svgAsset(
                                                'lib/assets/bankAccount01.svg',
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: w400_17(
                                                        context,
                                                        'Bank Account',
                                                        blackColor),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Transform.scale(
                                          scale: 1.2,
                                          child: Container(
                                            child: Checkbox.adaptive(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20), // Circular shape
                                              ),
                                              value: isCheckedList01[1],
                                              onChanged: (value) {
                                                setState(() {
                                                  for (int i = 0;
                                                      i <
                                                          isCheckedList01
                                                              .length;
                                                      i++) {
                                                    isCheckedList01[i] = (i ==
                                                        1); // Only second checkbox gets checked
                                                  }
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                Divider(color: textFieldBorderColor),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/me/settings');
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: screenSize.height * 0.025,
                      left: 0,
                      right: 0,
                      bottom: screenSize.height * 0.02,
                    ),
                    child: Container(
                      height: screenSize.height * 0.06,
                      width: screenSize.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: secondaryColor),
                      child: Center(
                          child: w500_17(context, 'Withdraw', whiteColor)),
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
